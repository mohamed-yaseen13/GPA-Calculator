import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/delete_scale_button.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/edit_scale_button.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scales_grade_table.dart';

class ScaleIsExpanded extends StatelessWidget {
  final List<List<String>> scale;
  final int index;
  final String title;

  const ScaleIsExpanded({
    super.key,
    required this.index,
    required this.scale,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScalesGradeTable(scale: scale),
        if (index >= 3)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditScaleButton(
                index: index >= 3 ? index - 3 : -1,
                title: title,
                scale: scale,
              ),
              DeleteScaleButton(index: index),
            ],
          ),
      ],
    );
  }
}
