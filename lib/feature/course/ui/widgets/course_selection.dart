import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';

class CourseSelection extends StatelessWidget {
  final int index;
  final SectionModel section;

  const CourseSelection({
    super.key,
    required this.index,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final selectionMode = context.read<CourseScreenCubit>().state.selectionMode;
    return selectionMode
        ? SizedBox(
          height: 24.h,
          width: 16.w,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              section.selected == true
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            onPressed: () {
              context.read<CourseScreenCubit>().toggleSelect(index);
            },
          ),
        )
        : Text('${index + 1}', style: TextStyle(fontSize: 16.sp));
  }
}
