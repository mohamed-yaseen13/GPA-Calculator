import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';

enum DrawerRoute { main, scenarios }

class AppDrawer extends StatelessWidget {
  final DrawerRoute selectedRoute;

  const AppDrawer({super.key, required this.selectedRoute});

  void _handleRouteSelected(BuildContext context, DrawerRoute route) {
    if (route == DrawerRoute.main) {
      AppConstants.isScenarioMode = false;
      resetMainCubits();
      context.pushReplacementNamed(AppRoutes.applicationAppBar);
    } else if (route == DrawerRoute.scenarios) {
      AppConstants.isScenarioMode = true;
      resetScenarioCubits();
      context.pushReplacementNamed(AppRoutes.scenariosScreen);
    }
  }

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
              SizedBox(height: 24.h),
              _DrawerTile(
                icon: Icons.dashboard_rounded,
                label: 'Main Dashboard',
                selected: selectedRoute == DrawerRoute.main,
                onTap: () => _handleRouteSelected(context, DrawerRoute.main),
              ),
              SizedBox(height: 12.h),
              _DrawerTile(
                icon: Icons.auto_awesome_motion_rounded,
                label: 'Scenarios',
                selected: selectedRoute == DrawerRoute.scenarios,
                onTap:
                    () => _handleRouteSelected(context, DrawerRoute.scenarios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _DrawerTile({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          selected
              ? Colors.orange.withAlpha((0.15 * 255).toInt())
              : Colors.transparent,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
          child: Row(
            children: [
              Icon(
                icon,
                color: selected ? Colors.orange : Colors.grey[700],
                size: 26.sp,
              ),
              SizedBox(width: 16.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.orange : Colors.grey[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
