import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/ui/application_app_bar.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/ui/course_screen.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_cubit.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/edit_password_screen.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scales/ui/scales_screen.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/add_custom_scale_screen.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/ui/scenarios_screen.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenario_main_screen.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/semester_screen.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/settings_screen.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_cubit.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.applicationAppBar:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => getIt<ApplicationAppBarCubit>()),
                  BlocProvider(create: (_) => getIt<ConverterCubit>()),
                  BlocProvider(create: (_) => getIt<CalculatorCubit>()),
                ],
                child: ApplicationAppBar(),
              ),
          settings: settings,
        );

      case AppRoutes.semesterScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: getIt<SemesterScreenCubit>()),
                ],
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
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => getIt<ScalesCubit>()),
                ],
                child: AddCustomScaleScreen(),
              ),
          settings: settings,
        );

      case AppRoutes.courseScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: getIt<CourseScreenCubit>()),
                ],
                child: CourseScreen(),
              ),
          settings: settings,
        );

      case AppRoutes.settingsScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => getIt<ScalesCubit>()),
                  BlocProvider.value(value: getIt<SettingsCubit>()),
                  BlocProvider.value(value: getIt<ApplicationAppBarCubit>()),
                  BlocProvider.value(value: getIt<SemesterScreenCubit>()),
                  BlocProvider.value(value: getIt<CourseScreenCubit>()),
                ],
                child: SettingsScreen(),
              ),
          settings: settings,
        );

      case AppRoutes.passwordScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: getIt<SettingsCubit>()),
                  BlocProvider.value(value: getIt<PasswordCubit>()),
                ],
                child: EditPasswordScreen(),
              ),
          settings: settings,
        );

      case AppRoutes.scenariosScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => getIt<ScenariosCubit>()),
                ],
                child: ScenariosScreen(),
              ),
        );

      case AppRoutes.scenarioMainScreen:
        final args = settings.arguments as Map;
        return MaterialPageRoute(
          builder:
              (_) => ScenarioMainScreen(
                scenario: args['scenario'],
                index: args['index'],
              ),
        );

      default:
        return null;
    }
  }
}
