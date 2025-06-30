import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';

class MainScreenListTile extends StatelessWidget {
  const MainScreenListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[400],
      title: Text('Main Dashboard', style: TextStyle(fontSize: 16.sp)),
      onTap: () {
        context.pushNamed(AppRoutes.applicationAppBar).then((_) {
          context.read<ApplicationAppBarCubit>().reloadStudent();
        });
      },
    );
  }
}
