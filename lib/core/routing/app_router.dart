import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/ui/application_app_bar.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/ui/course_screen.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/ui/scales_screen.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/add_custom_scale_screen.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/semester_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.applicationAppBar:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (_) => ApplicationAppBarCubit(
                      box: AppConstants.box,
                      student: AppConstants.student,
                    ),
                child: ApplicationAppBar(),
              ),
          settings: settings,
        );

      case AppRoutes.semesterScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<SemesterScreenCubit>(),
                child: SemesterScreen(),
              ),
          settings: settings,
        );

      case AppRoutes.scalesScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => getIt<ScalesCubit>()),
                  BlocProvider.value(value: getIt<SemesterScreenCubit>()),
                  BlocProvider.value(value: getIt<CourseScreenCubit>()),
                ],
                child: ScalesScreen(),
              ),
          settings: settings,
        );

      case AppRoutes.customScaleScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => ScalesCubit(),
                child: AddCustomScaleScreen(),
              ),
          settings: settings,
        );

      case AppRoutes.courseScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt<CourseScreenCubit>(),
                child: CourseScreen(),
              ),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
