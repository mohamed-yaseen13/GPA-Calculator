import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/dot_container.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scale_checkbox.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scale_is_expanded.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/scale_title.dart';

class ScaleContainer extends StatelessWidget {
  final int index;
  final String title;
  final List<List<String>> scale;

  const ScaleContainer({
    super.key,
    required this.title,
    required this.scale,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScalesCubit>().state;
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
                  DotContainer(isExpanded: isExpanded),
                  horizontalSpace(12),
                  ScaleTitle(title: title),
                  Spacer(),
                  ScaleCheckbox(index: index, scale: scale),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded)
          ScaleIsExpanded(index: index, scale: scale, title: title),
      ],
    );
  }
}
