import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/main_dashboard/ui/main_dashboard.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.mainDashboard:
        return MaterialPageRoute(builder: (_) => MainDashboard());

      default:
        return null;
    }
  }
}
