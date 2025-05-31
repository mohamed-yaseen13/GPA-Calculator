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
        Expanded(
          flex: 9,
          child: Text(
            'Course Work',
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        horizontalSpace(32),
        Expanded(
          flex: 6,
          child: Text(
            context
                .read<CourseScreenCubit>()
                .getCourseWorkScore()['got']
                .toString(),
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        horizontalSpace(32),
        Expanded(
          flex: 6,
          child: Text(
            context
                .read<CourseScreenCubit>()
                .getCourseWorkScore()['from']
                .toString(),
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
