import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/ui/widgets/main_screen_list_tile.dart';
import 'package:gpa_calculator/feature/application_app_bar/ui/widgets/scenarios_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Color(0xFFFFF6E7),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.h),
          child: ListView(
            children: [
              MainScreenListTile(),
              verticalSpace(12),
              ScenariosListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
