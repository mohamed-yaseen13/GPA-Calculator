import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/course_selection.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/edit_section_icon.dart';

class SectionRowData extends StatelessWidget {
  final int index;
  final SectionModel section;

  const SectionRowData({super.key, required this.index, required this.section});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CourseSelection(index: index, section: section),
        ),
        Expanded(
          flex: 7,
          child: Text(
            section.name,
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            section.obtainedMark.toString(),
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            section.fullMark.toString(),
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: EditSectionIcon(index: index, section: section),
        ),
      ],
    );
  }
}
