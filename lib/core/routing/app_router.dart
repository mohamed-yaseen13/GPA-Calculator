import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/ui/application_app_bar.dart';
import 'package:gpa_calculator/feature/semester/ui/semester_screen.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.applicationAppBar:
        final Box box = Hive.box('studentData');
        final StudentModel student = box.get('default');

        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => ApplicationAppBarCubit(box, student),
                child: ApplicationAppBar(),
              ),
        );

      case AppRoutes.semesterScreen:
        return MaterialPageRoute(builder: (_) => SemesterScreen());

      default:
        return null;
    }
  }
}
