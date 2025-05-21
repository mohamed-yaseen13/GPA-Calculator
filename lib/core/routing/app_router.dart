import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/main_dashboard/ui/main_dashboard.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/semester_screen.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.mainDashboard:
        return MaterialPageRoute(
          builder: (_) => MainDashboard(),
          settings: settings,
        );

      case AppRoutes.semesterScreen:
        final Box box = Hive.box('studentData');
        final StudentModel student = box.get('default');
        final List<String> grades = [
          '--',
          'A+',
          'A',
          'A-',
          'B+',
          'B',
          'B-',
          'C+',
          'C',
          'C-',
          'D+',
          'D',
          'F',
          'Fr',
        ];

        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SemesterScreenCubit(box, grades, student),
                child: SemesterScreen(),
              ),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
