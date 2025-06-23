import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';

class SectionCourseGrade extends StatelessWidget {
  final CourseModel course;

  const SectionCourseGrade({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final Color changedColor =
        context.read<GpaCalculationsCubit>().getGradePoint(course.grade) >
                context.read<GpaCalculationsCubit>().getGradePoint(
                  course.newGrade,
                )
            ? Colors.red
            : Colors.green;
    if (course.grade == '--') {
      return Text(
        'Max Grade You Can Get : ${context.read<CourseScreenCubit>().getMaxGradePossible()}',
        style: TextStyle(fontSize: 16.sp),
      );
    }
    if (course.isChanged) {
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'You Got : ',
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            TextSpan(
              text: course.grade,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            TextSpan(text: '    '),
            TextSpan(
              text: course.newGrade,
              style: TextStyle(fontSize: 16.sp, color: changedColor),
            ),
          ],
        ),
      );
    }
    return Text(
      'You Got : ${course.grade}',
      style: TextStyle(fontSize: 16.sp),
      textAlign: TextAlign.center,
    );
  }
}
