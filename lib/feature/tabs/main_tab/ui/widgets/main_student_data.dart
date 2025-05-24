import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${context.read<ApplicationAppBarCubit>().gpaCubit.student.cgpa}',
                style: TextStyle(fontSize: 18.sp),
              ),
              Text(
                '${context.read<ApplicationAppBarCubit>().gpaCubit.student.totalCredits}',
                style: TextStyle(fontSize: 18.sp, color: AppColors.mainOrange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
