import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';

class CourseButton extends StatelessWidget {
  final int courseIndex;
  final CourseModel course;
  final int semesterIndex;

  const CourseButton({
    super.key,
    required this.course,
    required this.courseIndex,
    required this.semesterIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {
          context.pushNamed(
            AppRoutes.courseScreen,
            arguments: {
              'semesterIndex': semesterIndex,
              'courseIndex': courseIndex,
            },
          );
        },
        child: Text(
          course.name,
          style: TextStyle(fontSize: 16.sp),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
