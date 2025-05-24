import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';

class MainStudentData extends StatelessWidget {
  const MainStudentData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/graduation_hat_2.svg'),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cumulative GPA: ', style: TextStyle(fontSize: 18.sp)),
              Text('Total Credits: ', style: TextStyle(fontSize: 18.sp)),
            ],
          ),
          horizontalSpace(12),
          BlocBuilder<GpaCalculationsCubit, GpaCalculationsState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.cgpa.toStringAsFixed(2),
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  Text(
                    '${state.totalCredits}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.mainOrange,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
