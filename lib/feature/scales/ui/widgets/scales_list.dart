import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scales_grade_table.dart';

class ScalesList extends StatelessWidget {
  final int index;
  final String title;
  final List<List<String>> scales;

  const ScalesList({
    super.key,
    required this.title,
    required this.scales,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScalesCubit>().state;
    final isSelected = index == state.selectedIndex;
    final isExpanded = state.isExpandedMap[index] ?? false;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h, right: 12.w, left: 12.w),
          child: Container(
            width: double.infinity,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16.sp),
              onTap: () => context.read<ScalesCubit>().toggleExpanded(index),
              child: Row(
                children: [
                  horizontalSpace(12),
                  Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      color: isExpanded ? Colors.black : Colors.white,
                    ),
                  ),
                  horizontalSpace(12),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap:
                          () => context.read<ScalesCubit>().selectScale(index),
                      child: Icon(
                        isSelected
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: isSelected ? AppColors.mainOrange : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded) ScalesGradeTable(scales: scales),
      ],
    );
  }
}
