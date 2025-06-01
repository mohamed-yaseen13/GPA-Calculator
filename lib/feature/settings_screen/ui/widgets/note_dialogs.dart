import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';

const List<String> noteColors = [
  'Blue',
  'Green',
  'Pink',
  'Purple',
  'White',
  'Yellow',
];

class NoteDialogs {
  static Future<String?> showColorDialog(
    BuildContext context,
    String selectedColor,
  ) async {
    return await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Note Color',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:
                noteColors.map((color) {
                  return RadioListTile<String>(
                    value: color,
                    groupValue: selectedColor,
                    title: Text(color),
                    activeColor: color == 'Yellow' ? Colors.yellow : null,
                    onChanged: (val) {
                      context.pop(val);
                    },
                  );
                }).toList(),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
