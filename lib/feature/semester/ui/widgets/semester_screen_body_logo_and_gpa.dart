import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';

class SemesterScreenBodyLogoAndGpa extends StatelessWidget {
  const SemesterScreenBodyLogoAndGpa({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
      buildWhen:
          (previous, current) =>
              previous.semesters[previous.selectedIndex].gpa !=
                  current.semesters[current.selectedIndex].gpa ||
              previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        final gpa = state.semesters[state.selectedIndex].gpa;

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
                  Text('GPA: ', style: TextStyle(fontSize: 18.sp)),
                  Text(
                    gpa.toStringAsFixed(2),
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
