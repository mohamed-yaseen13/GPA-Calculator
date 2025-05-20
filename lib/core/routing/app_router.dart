import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/main_dashboard/ui/main_dashboard.dart';
import 'package:gpa_calculator/feature/semester/ui/semester_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.mainDashboard:
        return MaterialPageRoute(
          builder: (_) => MainDashboard(),
          settings: settings,
        );

      case AppRoutes.semesterScreen:
        return MaterialPageRoute(
          builder: (_) => SemesterScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
