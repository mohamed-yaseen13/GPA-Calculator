import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/core/widgets/data_container.dart';

class MainStudentData extends StatelessWidget {
  const MainStudentData({super.key});

  @override
  Widget build(BuildContext context) {
    return DataContainer(
      leftColumn: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cumulative GPA: ', style: TextStyle(fontSize: 18.sp)),
          verticalSpace(12),
          Text('Total Credits: ', style: TextStyle(fontSize: 18.sp)),
          verticalSpace(12),
          Text('Max CGPA you can get: ', style: TextStyle(fontSize: 18.sp)),
        ],
      ),
      rightColumn: BlocBuilder<GpaCalculationsCubit, GpaCalculationsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.cgpa.toStringAsFixed(2),
                style: TextStyle(fontSize: 18.sp),
              ),
              verticalSpace(12),
              Text(
                '${state.totalCredits}',
                style: TextStyle(fontSize: 18.sp, color: AppColors.mainOrange),
              ),
              verticalSpace(12),
              Text(
                context
                    .read<GpaCalculationsCubit>()
                    .getMaxCgpaPossible()
                    .toStringAsFixed(2),
                style: TextStyle(fontSize: 18.sp, color: AppColors.mainOrange),
              ),
            ],
          );
        },
      ),
    );
  }
}
