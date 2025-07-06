import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/widgets/drawer_tile.dart';

enum DrawerRoute { main, scenarios, calendar, timeTable }

class AppDrawer extends StatelessWidget {
  final DrawerRoute selectedRoute;

  const AppDrawer({super.key, required this.selectedRoute});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xFFFFF6E7),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24),
              DrawerTile(
                icon: Icons.dashboard_rounded,
                label: 'Main Dashboard',
                selected: selectedRoute == DrawerRoute.main,
                onTap: () => handleRouteSelected(context, DrawerRoute.main),
              ),
              verticalSpace(12),
              DrawerTile(
                icon: Icons.auto_awesome_motion_rounded,
                label: 'Scenarios',
                selected: selectedRoute == DrawerRoute.scenarios,
                onTap:
                    () => handleRouteSelected(context, DrawerRoute.scenarios),
              ),
              verticalSpace(12),
              DrawerTile(
                icon: Icons.calendar_today,
                label: 'Calendar',
                selected: selectedRoute == DrawerRoute.calendar,
                onTap: () => handleRouteSelected(context, DrawerRoute.calendar),
              ),
              verticalSpace(12),
              DrawerTile(
                icon: Icons.more_time,
                label: 'TimeTable',
                selected: selectedRoute == DrawerRoute.timeTable,
                onTap:
                    () => handleRouteSelected(context, DrawerRoute.timeTable),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
