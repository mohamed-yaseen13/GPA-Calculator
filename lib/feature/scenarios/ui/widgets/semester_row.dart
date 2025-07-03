import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class SemesterRow extends StatelessWidget {
  final SemesterModel semester;
  final int index;

  const SemesterRow({super.key, required this.semester, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpace(12.w),
        Text(
          semester.name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        Spacer(),
        SizedBox(
          height: 24.h,
          width: 16.w,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              semester.selected == true
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            onPressed: () {
              context.read<ApplicationAppBarCubit>().toggleSelect(index);
            },
          ),
        ),
        horizontalSpace(12.w),
      ],
    );
  }
}
