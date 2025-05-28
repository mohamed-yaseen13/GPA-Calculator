import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

class SemesterSelection extends StatelessWidget {
  final int index;
  final CourseModel course;

  const SemesterSelection({
    super.key,
    required this.course,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final selectionMode =
        context.read<SemesterScreenCubit>().state.selectionMode;
    return selectionMode
        ? SizedBox(
          height: 24.h,
          width: 16.w,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              course.selected == true
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            onPressed: () {
              context.read<SemesterScreenCubit>().toggleSelect(index);
            },
          ),
        )
        : Text('${index + 1}', style: TextStyle(fontSize: 16.sp));
  }
}
