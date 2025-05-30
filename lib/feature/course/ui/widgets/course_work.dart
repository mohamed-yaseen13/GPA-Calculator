import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';

class CourseWork extends StatelessWidget {
  const CourseWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Course Work', style: TextStyle(fontSize: 16.sp)),
        horizontalSpace(32),
        Text(
          context
              .read<CourseScreenCubit>()
              .getCourseWorkScore()['got']
              .toString(),
          style: TextStyle(fontSize: 16.sp),
        ),
        horizontalSpace(32),
        Text(
          context
              .read<CourseScreenCubit>()
              .getCourseWorkScore()['from']
              .toString(),
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
  }
}
