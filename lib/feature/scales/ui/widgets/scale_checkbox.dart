import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

class ScaleCheckbox extends StatelessWidget {
  final int index;
  final List<List<String>> scale;

  const ScaleCheckbox({super.key, required this.index, required this.scale});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScalesCubit>().state;
    final isSelected = index == state.selectedIndex;
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: GestureDetector(
        onTap: () {
          context.read<ScalesCubit>().selectScale(index);
          context.read<GpaCalculationsCubit>().changeScale(scale);
          context.read<SemesterScreenCubit>().loadGrades();
          context.read<CourseScreenCubit>().changeScale(scale);
        },
        child: Icon(
          isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          color: isSelected ? AppColors.mainOrange : Colors.black,
        ),
      ),
    );
  }
}
