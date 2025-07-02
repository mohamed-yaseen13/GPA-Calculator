import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';

class ScenarioImportButton extends StatelessWidget {
  final int index;
  const ScenarioImportButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 16.h),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
        ),
        onPressed: () {
          context.read<ApplicationAppBarCubit>().importStudentData(
            index,
            context,
          );
          resetScenarioCubits();
          int removed = 0;
          context.pushNamedAndRemoveUntil(
            AppRoutes.scenarioMainScreen,
            predicate: (route) {
              if (removed < 2) {
                removed++;
                return false;
              }
              return true;
            },
          );
        },
        child: Text(
          'Import',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
