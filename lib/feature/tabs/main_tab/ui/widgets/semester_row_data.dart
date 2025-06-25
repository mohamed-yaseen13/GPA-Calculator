import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/edit_semester_icon.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/main_selection.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_button.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_cgpa.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_gpa.dart';

class SemesterRowData extends StatelessWidget {
  final int index;
  final SemesterModel semester;

  const SemesterRowData({
    super.key,
    required this.index,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: MainSelection(index: index, semester: semester),
        ),
        Expanded(
          flex: 7,
          child: SemesterButton(index: index, semester: semester),
        ),
        Expanded(flex: 6, child: SemesterGpa(index: index, semester: semester)),
        Expanded(
          flex: 6,
          child: SemesterCgpa(index: index, semester: semester),
        ),
        Expanded(
          flex: 1,
          child: EditSemesterIcon(index: index, semester: semester),
        ),
      ],
    );
  }
}
