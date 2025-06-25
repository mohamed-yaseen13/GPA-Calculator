import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_button.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_grade.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/edit_course_icon.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_selection.dart';

class CourseRowData extends StatelessWidget {
  final int index;
  final int semesterIndex;
  final CourseModel course;

  const CourseRowData({
    super.key,
    required this.course,
    required this.index,
    required this.semesterIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SemesterSelection(index: index, course: course),
        ),
        Expanded(
          flex: 7,
          child: CourseButton(
            courseIndex: index,
            course: course,
            semesterIndex: semesterIndex,
          ),
        ),
        Expanded(flex: 6, child: CourseGrade(course: course)),
        Expanded(
          flex: 6,
          child: Text(
            course.credits.toString(),
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(flex: 1, child: EditCourseIcon(index: index, course: course)),
      ],
    );
  }
}
