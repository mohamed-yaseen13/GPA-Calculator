import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/feature/timetable/data/models/time_slot_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:open_filex/open_filex.dart';
import 'package:external_path/external_path.dart';

Future<bool> requestStoragePermission() async {
  if (!Platform.isAndroid) return true;

  final androidInfo = await DeviceInfoPlugin().androidInfo;
  final sdk = androidInfo.version.sdkInt;

  if (sdk >= 33) {
    final result = await Permission.photos.request();
    return result.isGranted;
  } else if (sdk >= 30) {
    final result = await Permission.manageExternalStorage.request();
    return result.isGranted;
  } else {
    final result = await Permission.storage.request();
    return result.isGranted;
  }
}

Future<void> exportTimetableToDownloads({
  required BuildContext context,
  required List<TimeSlotModel> slots,
  required String fileName,
  bool autoOpen = false, // Option to control auto-opening
}) async {
  try {
    // Ask for storage permission
    final granted = await requestStoragePermission();
    if (!granted) {
      if (!context.mounted) return;
      _showSnackBar(context, 'Storage permission is required');
      return;
    }

    // Generate PDF
    final pdf = await _generatePDF(slots);

    // Get Downloads folder using external_path
    final downloadPath = await ExternalPath.getExternalStoragePublicDirectory(
      ExternalPath.DIRECTORY_DOWNLOAD,
    );

    final sanitizedFileName = _sanitizeFileName(fileName.trim());
    final filePath = '$downloadPath/$sanitizedFileName.pdf';

    // Save file with unique timestamp to avoid conflicts
    final savedFilePath = await _saveFileWithRetry(filePath, pdf);

    // Get just the filename for display
    final savedFileName = savedFilePath.split('/').last;

    if (!context.mounted) return;
    _showSnackBar(context, '✅ Saved to Downloads as $savedFileName');

    // Open the file if auto-open is enabled
    if (autoOpen) {
      try {
        await OpenFilex.open(savedFilePath);
      } catch (e) {
        if (context.mounted) {
          _showSnackBar(context, 'File saved but could not open automatically');
        }
      }
    }
  } catch (e) {
    if (context.mounted) {
      print('Error exporting PDF: ${e.toString()}');
    }
  }
}

Future<pw.Document> _generatePDF(List<TimeSlotModel> slots) async {
  final pdf = pw.Document();

  pw.Font arabicFont = pw.Font.courier();
  pw.Font englishFont = pw.Font.courier();

  try {
    // Load Arabic font (you need to add this to your assets)
    final arabicFontData = await rootBundle.load(
      'assets/fonts/notoSansArabic.ttf',
    );
    arabicFont = pw.Font.ttf(arabicFontData);

    // Load English font
    final englishFontData = await rootBundle.load(
      'assets/fonts/LibertinusMono-Regular.ttf',
    );
    englishFont = pw.Font.ttf(englishFontData);
  } catch (e) {
    print('Error loading fonts: $e');
    // Fallback to default fonts if custom fonts fail to load
  }

  // Group by day/interval
  final grouped = <String, Map<String, List<TimeSlotModel>>>{};
  for (final slot in slots) {
    grouped[slot.day] ??= {};
    grouped[slot.day]![slot.interval] ??= [];
    grouped[slot.day]![slot.interval]!.add(slot);
  }

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a3,
      build: (_) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Table(
              border: pw.TableBorder.all(),
              defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
              columnWidths: {
                for (int i = 0; i <= 7; i++) i: pw.FixedColumnWidth(160),
              },
              children: [
                // Header row
                pw.TableRow(
                  children: [
                    pw.Container(
                      height: 40,
                      alignment: pw.Alignment.center,
                      child: pw.Text('', textAlign: pw.TextAlign.center),
                    ),
                    ...AppConstants.days.map(
                      (day) => pw.Container(
                        height: 40,
                        alignment: pw.Alignment.center,
                        child: pw.Text(
                          day,
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                // Data rows
                ...AppConstants.intervals.map((interval) {
                  return pw.TableRow(
                    children: [
                      pw.Container(
                        height: 90,
                        alignment: pw.Alignment.center,
                        child: pw.Text(
                          interval,
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      ...AppConstants.days.map((day) {
                        final items = grouped[day]?[interval] ?? [];
                        return pw.Container(
                          height: 90,
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(6),
                          decoration:
                              items.isEmpty
                                  ? null
                                  : pw.BoxDecoration(
                                    color: _getCellColor(items.first.type),
                                  ),
                          child:
                              items.isEmpty
                                  ? pw.Text('', textAlign: pw.TextAlign.center)
                                  : pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    children:
                                        items.map((s) {
                                          final safeType =
                                              s.type.isEmpty
                                                  ? '[No type]'
                                                  : s.type;
                                          final safeContent =
                                              s.content.isEmpty
                                                  ? '[No content]'
                                                  : s.content;
                                          return pw.Padding(
                                            padding:
                                                const pw.EdgeInsets.symmetric(
                                                  vertical: 2,
                                                ),
                                            child: pw.Column(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.center,
                                              children: _buildTextWithDirection(
                                                '$safeType: $safeContent',
                                                arabicFont: arabicFont,
                                                englishFont: englishFont,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                  ),
                        );
                      }),
                    ],
                  );
                }),
              ],
            ),
          ],
        );
      },
    ),
  );

  return pdf;
}

Future<String> _saveFileWithRetry(String filePath, pw.Document pdf) async {
  // Generate unique filename to avoid conflicts
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final directory = File(filePath).parent;
  final fileName = File(filePath).uri.pathSegments.last.replaceAll('.pdf', '');
  final uniqueFilePath = '${directory.path}/${fileName}_$timestamp.pdf';

  try {
    final file = File(uniqueFilePath);

    // Create parent directory if it doesn't exist
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    // Save the PDF
    final bytes = await pdf.save();
    await file.writeAsBytes(bytes, mode: FileMode.write);

    return uniqueFilePath; // Return the actual saved file path
  } catch (e) {
    throw Exception('Failed to save PDF: $e');
  }
}

String _sanitizeFileName(String fileName) {
  // Remove invalid characters for file names
  return fileName.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_').trim();
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

Future<String?> _askForFileName(BuildContext context) async {
  final controller = TextEditingController(text: 'timetable');

  return await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder:
        (dialogContext) => AlertDialog(
          title: const Text('Enter PDF file name'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'File name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = controller.text.trim();
                if (name.isNotEmpty) {
                  Navigator.pop(dialogContext, name);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
  );
}

PdfColor _getCellColor(String type) {
  switch (type.toLowerCase()) {
    case 'lecture':
      return PdfColor.fromInt(0xFFADD8E6); // light blue
    case 'section':
      return PdfColor.fromInt(0xFF90EE90); // light green
    case 'event':
      return PdfColor.fromInt(
        0xFFFFA07A,
      ); // light red (using light salmon as example)
    default:
      return PdfColor.fromInt(0xFFFFFFFF); // white for unknown types
  }
}

Future<void> handleExport(
  BuildContext context,
  List<TimeSlotModel> slots,
) async {
  final fileName = await _askForFileName(context);
  if (fileName == null || fileName.trim().isEmpty) return;

  await Future.delayed(Duration(milliseconds: 100));
  await exportTimetableToDownloads(
    context: context,
    slots: slots,
    fileName: fileName,
    autoOpen: true,
  );
}

bool _isArabic(String text) {
  final arabicRegex = RegExp(
    r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]',
    unicode: true,
  );
  return arabicRegex.hasMatch(text);
}

List<pw.Widget> _buildTextWithDirection(
  String text, {
  required pw.Font arabicFont,
  required pw.Font englishFont,
}) {
  final segments = _splitTextByLanguage(text);
  final widgets = <pw.Widget>[];

  for (final segment in segments) {
    if (segment.isArabic) {
      widgets.add(
        pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Text(segment.text, style: pw.TextStyle(font: arabicFont)),
        ),
      );
    } else {
      widgets.add(
        pw.Text(segment.text, style: pw.TextStyle(font: englishFont)),
      );
    }
  }

  return widgets;
}

List<({String text, bool isArabic})> _splitTextByLanguage(String text) {
  final segments = <({String text, bool isArabic})>[];
  final words = text.split(' ');
  var currentIsArabic = false;
  var buffer = StringBuffer();

  for (final word in words) {
    final wordIsArabic = _isArabic(word);

    if (buffer.isEmpty) {
      currentIsArabic = wordIsArabic;
      buffer.write(word);
    } else if (wordIsArabic == currentIsArabic) {
      buffer.write(' $word');
    } else {
      segments.add((text: buffer.toString(), isArabic: currentIsArabic));
      buffer = StringBuffer(word);
      currentIsArabic = wordIsArabic;
    }
  }

  if (buffer.isNotEmpty) {
    segments.add((text: buffer.toString(), isArabic: currentIsArabic));
  }

  return segments;
}
