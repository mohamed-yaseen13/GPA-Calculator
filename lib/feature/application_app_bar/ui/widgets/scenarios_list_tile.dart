import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';

class ScenariosListTile extends StatelessWidget {
  const ScenariosListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[400],
      title: Text('Scenarios', style: TextStyle(fontSize: 16.sp)),
      onTap: () {
        context.pushNamed(AppRoutes.scenariosScreen);
      },
    );
  }
}
