import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';

class ScenariosListTile extends StatelessWidget {
  const ScenariosListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[400],
      title: Text('Scenarios', style: TextStyle(fontSize: 16.sp)),
      onTap: () {
        getIt.resetLazySingleton<ApplicationAppBarCubit>();
        context.pushReplacementNamed(AppRoutes.scenariosScreen);
      },
    );
  }
}
