import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

class SemesterScreenBodyLogoAndGpa extends StatelessWidget {
  const SemesterScreenBodyLogoAndGpa({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 8.h, left: 16.w, right: 32.w),
      child: BlocBuilder<GpaCalculationsCubit, GpaCalculationsState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Attempted Credits : ',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      verticalSpace(12),
                      Text(
                        'Earned Credits : ',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      verticalSpace(12),
                      Text('GPA', style: TextStyle(fontSize: 18.sp)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state
                            .semesters[context
                                .read<SemesterScreenCubit>()
                                .state
                                .selectedIndex]
                            .gpa
                            .toStringAsFixed(2),
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      verticalSpace(12),
                      Text(
                        state
                            .semesters[context
                                .read<SemesterScreenCubit>()
                                .state
                                .selectedIndex]
                            .gpa
                            .toStringAsFixed(2),
                        style: TextStyle(fontSize: 18.sp, color: Colors.green),
                      ),
                      verticalSpace(12),
                      Text(
                        state
                            .semesters[context
                                .read<SemesterScreenCubit>()
                                .state
                                .selectedIndex]
                            .gpa
                            .toStringAsFixed(2),
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
