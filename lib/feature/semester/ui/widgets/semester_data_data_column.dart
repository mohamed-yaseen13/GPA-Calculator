import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

class SemesterDataDataColumn extends StatelessWidget {
  const SemesterDataDataColumn({super.key});

  @override
  Widget build(BuildContext widgetContext) {
    return BlocBuilder<GpaCalculationsCubit, GpaCalculationsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state
                  .semesters[context
                      .read<SemesterScreenCubit>()
                      .state
                      .selectedIndex]
                  .attemptedCredits
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
                  .earnedCredits
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
            verticalSpace(12),
            Text(
              context
                  .read<GpaCalculationsCubit>()
                  .getMaxGpaPossible(
                    context.read<SemesterScreenCubit>().state.selectedIndex,
                  )
                  .toStringAsFixed(2),
              style: TextStyle(fontSize: 18.sp),
            ),
          ],
        );
      },
    );
  }
}
