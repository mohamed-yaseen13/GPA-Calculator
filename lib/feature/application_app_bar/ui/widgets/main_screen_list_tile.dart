import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';

class MainScreenListTile extends StatelessWidget {
  const MainScreenListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[400],
      title: Text('Main Dashboard', style: TextStyle(fontSize: 16.sp)),
      onTap: () {
        AppConstants.isScenarioMode = false;
        resetMainCubits();
        context.pushReplacementNamed(AppRoutes.applicationAppBar);
      },
    );
  }
}
