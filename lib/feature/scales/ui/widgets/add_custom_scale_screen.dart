import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/grade_field.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/percentage_field.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/points_field.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/save_scale_button.dart';

class AddCustomScaleScreen extends StatefulWidget {
  const AddCustomScaleScreen({super.key});

  @override
  State<AddCustomScaleScreen> createState() => _AddCustomScaleScreenState();
}

class _AddCustomScaleScreenState extends State<AddCustomScaleScreen> {
  final TextEditingController _titleController = TextEditingController();
  final List<List<String>> _rows = [];
  int? _editIndex;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      if (args != null) {
        _titleController.text = args['title'] ?? '';
        final rows = args['rows'] as List<List<String>>?;
        if (rows != null) _rows.addAll(rows.map((e) => List<String>.from(e)));
        _editIndex = args['index'] as int?;
      }
      _initialized = true;
    }
  }

  void _addRow() {
    setState(() {
      _rows.add(['', '', '']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _editIndex != null
              ? 'Edit ${_titleController.text.isNotEmpty ? _titleController.text : "Custom Scale"}'
              : 'Add Custom Scale',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Scale Title'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _rows.length,
                itemBuilder:
                    (context, i) => Row(
                      children: [
                        GradeField(
                          value: _rows[i][0],
                          onChanged: (val) => setState(() => _rows[i][0] = val),
                        ),
                        PercentageField(
                          value: _rows[i][1],
                          rowIndex: i,
                          rows: _rows,
                          onChanged: (val) => setState(() => _rows[i][1] = val),
                        ),
                        PointsField(
                          value: _rows[i][2],
                          onChanged: (val) => setState(() => _rows[i][2] = val),
                        ),
                      ],
                    ),
              ),
            ),
            Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                  ),
                  onPressed: _addRow,
                  child: Text(
                    'Add Row',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                SaveScaleButton(
                  titleController: _titleController,
                  rows: _rows,
                  editIndex: _editIndex,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
