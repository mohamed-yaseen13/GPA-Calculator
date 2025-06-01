import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/ui/application_app_bar.dart';
import 'package:gpa_calculator/feature/course/ui/course_screen.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/edit_password_screen.dart';
import 'package:gpa_calculator/feature/scales/ui/scales_screen.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/add_custom_scale_screen.dart';
import 'package:gpa_calculator/feature/semester/ui/semester_screen.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/settings_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.applicationAppBar:
        return MaterialPageRoute(
          builder: (_) => ApplicationAppBar(),
          settings: settings,
        );

      case AppRoutes.semesterScreen:
        return MaterialPageRoute(
          builder: (_) => SemesterScreen(),
          settings: settings,
        );

      case AppRoutes.scalesScreen:
        return MaterialPageRoute(
          builder: (_) => ScalesScreen(),
          settings: settings,
        );

      case AppRoutes.customScaleScreen:
        return MaterialPageRoute(
          builder: (_) => AddCustomScaleScreen(),
          settings: settings,
        );

      case AppRoutes.courseScreen:
        return MaterialPageRoute(
          builder: (_) => CourseScreen(),
          settings: settings,
        );

      case AppRoutes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
          settings: settings,
        );

      case AppRoutes.passwordScreen:
        return MaterialPageRoute(
          builder: (_) => EditPasswordScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
