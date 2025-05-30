import 'package:flutter/material.dart';
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

  void _addRow() {
    setState(() {
      _rows.add(['', '', '']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Custom Scale')),
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
                ElevatedButton(onPressed: _addRow, child: Text('Add Row')),
                Spacer(),
                SaveScaleButton(titleController: _titleController, rows: _rows),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
