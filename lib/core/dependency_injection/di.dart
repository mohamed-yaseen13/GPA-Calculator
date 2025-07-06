import 'package:get_it/get_it.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/calendar/logic/cubit/calendar_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_cubit.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_cubit.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';
import 'package:gpa_calculator/feature/timetable/logic/cubit/time_table_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt(
  int selectedScaleIndex,
  List<Map<String, dynamic>> customScales,
) async {
  getIt.registerFactory<ScalesCubit>(() => ScalesCubit());

  getIt.registerLazySingleton<GpaCalculationsCubit>(
    () =>
        GpaCalculationsCubit(
            box: AppConstants.box,
            student: AppConstants.student,
            scale:
                Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
          )
          ..calculateGpaAndCgpa()
          ..loadSettings(),
  );

  getIt.registerLazySingleton<GpaCalculationsCubit>(
    () =>
        GpaCalculationsCubit(
            box: AppConstants.scenariosBox,
            student: AppConstants.selectedScenario!.student,
            scale:
                Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
            scenarioIndex: AppConstants.selectedScenarioIndex,
          )
          ..calculateGpaAndCgpa()
          ..loadSettings(),
    instanceName: 'scenario',
  );

  getIt.registerLazySingleton<ApplicationAppBarCubit>(
    () => ApplicationAppBarCubit(
      box: AppConstants.box,
      student: AppConstants.student,
    ),
  );

  getIt.registerLazySingleton<ApplicationAppBarCubit>(
    () => ApplicationAppBarCubit(
      box: AppConstants.scenariosBox,
      student: AppConstants.selectedScenario!.student,
      scenarioIndex: AppConstants.selectedScenarioIndex,
    ),
    instanceName: 'scenario',
  );

  getIt.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit()..loadSettings(),
  );

  getIt.registerFactory<PasswordCubit>(() => PasswordCubit());

  getIt.registerFactory<ConverterCubit>(() => ConverterCubit());

  getIt.registerFactory<CalculatorCubit>(() => CalculatorCubit());

  getIt.registerFactory<ScenariosCubit>(
    () => ScenariosCubit(scenariosBox: AppConstants.scenariosBox),
  );

  getIt.registerFactory<CalendarCubit>(
    () => CalendarCubit(AppConstants.eventsBox),
  );

  getIt.registerFactory<TimeTableCubit>(
    () => TimeTableCubit(box: AppConstants.timeBox),
  );
}

Future<void> resetSemesterScreenCubit() async {
  if (getIt.isRegistered<SemesterScreenCubit>()) {
    getIt.unregister<SemesterScreenCubit>();
  }

  if (getIt.isRegistered<SemesterScreenCubit>(instanceName: 'scenario')) {
    getIt.unregister<SemesterScreenCubit>(instanceName: 'scenario');
  }

  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();

  getIt.registerLazySingleton<SemesterScreenCubit>(
    () => SemesterScreenCubit(
      box: AppConstants.box,
      student: AppConstants.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
    ),
  );

  getIt.registerLazySingleton<SemesterScreenCubit>(
    () => SemesterScreenCubit(
      box: AppConstants.scenariosBox,
      student: AppConstants.selectedScenario!.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
      scenarioIndex: AppConstants.selectedScenarioIndex,
    ),
    instanceName: 'scenario',
  );
}

Future<void> resetCourseScreenCubit() async {
  if (getIt.isRegistered<CourseScreenCubit>()) {
    getIt.unregister<CourseScreenCubit>();
  }

  if (getIt.isRegistered<CourseScreenCubit>(instanceName: 'scenario')) {
    getIt.unregister<CourseScreenCubit>(instanceName: 'scenario');
  }

  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();

  getIt.registerLazySingleton<CourseScreenCubit>(
    () => CourseScreenCubit(
      box: AppConstants.box,
      student: AppConstants.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
    )..loadSettings(),
  );

  getIt.registerLazySingleton<CourseScreenCubit>(
    () => CourseScreenCubit(
      box: AppConstants.scenariosBox,
      student: AppConstants.selectedScenario!.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
      scenarioIndex: AppConstants.selectedScenarioIndex,
    )..loadSettings(),
    instanceName: 'scenario',
  );
}

Future<void> resetMainCubits() async {
  if (getIt.isRegistered<ApplicationAppBarCubit>()) {
    getIt.unregister<ApplicationAppBarCubit>();
  }
  if (getIt.isRegistered<GpaCalculationsCubit>()) {
    getIt.unregister<GpaCalculationsCubit>();
  }

  if (getIt.isRegistered<CourseScreenCubit>()) {
    getIt.unregister<CourseScreenCubit>();
  }

  if (getIt.isRegistered<SemesterScreenCubit>()) {
    getIt.unregister<SemesterScreenCubit>();
  }

  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();

  getIt.registerLazySingleton<ApplicationAppBarCubit>(
    () => ApplicationAppBarCubit(
      box: AppConstants.box,
      student: AppConstants.student,
    ),
  );
  getIt.registerLazySingleton<GpaCalculationsCubit>(
    () => GpaCalculationsCubit(
      box: AppConstants.box,
      student: AppConstants.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
    ),
  );

  getIt.registerLazySingleton<CourseScreenCubit>(
    () => CourseScreenCubit(
      box: AppConstants.box,
      student: AppConstants.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
    )..loadSettings(),
  );

  getIt.registerLazySingleton<SemesterScreenCubit>(
    () => SemesterScreenCubit(
      box: AppConstants.box,
      student: AppConstants.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
    ),
  );
}

Future<void> resetScenarioCubits() async {
  if (getIt.isRegistered<ApplicationAppBarCubit>(instanceName: 'scenario')) {
    getIt.unregister<ApplicationAppBarCubit>(instanceName: 'scenario');
  }
  if (getIt.isRegistered<GpaCalculationsCubit>(instanceName: 'scenario')) {
    getIt.unregister<GpaCalculationsCubit>(instanceName: 'scenario');
  }

  if (getIt.isRegistered<CourseScreenCubit>(instanceName: 'scenario')) {
    getIt.unregister<CourseScreenCubit>(instanceName: 'scenario');
  }

  if (getIt.isRegistered<SemesterScreenCubit>(instanceName: 'scenario')) {
    getIt.unregister<SemesterScreenCubit>(instanceName: 'scenario');
  }

  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();

  getIt.registerLazySingleton<ApplicationAppBarCubit>(
    () => ApplicationAppBarCubit(
      box: AppConstants.scenariosBox,
      student: AppConstants.selectedScenario!.student,
      scenarioIndex: AppConstants.selectedScenarioIndex,
    ),
    instanceName: 'scenario',
  );
  getIt.registerLazySingleton<GpaCalculationsCubit>(
    () => GpaCalculationsCubit(
      box: AppConstants.scenariosBox,
      student: AppConstants.selectedScenario!.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
      scenarioIndex: AppConstants.selectedScenarioIndex,
    ),
    instanceName: 'scenario',
  );

  getIt.registerLazySingleton<CourseScreenCubit>(
    () => CourseScreenCubit(
      box: AppConstants.scenariosBox,
      student: AppConstants.selectedScenario!.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
      scenarioIndex: AppConstants.selectedScenarioIndex,
    )..loadSettings(),
    instanceName: 'scenario',
  );

  getIt.registerLazySingleton<SemesterScreenCubit>(
    () => SemesterScreenCubit(
      box: AppConstants.scenariosBox,
      student: AppConstants.selectedScenario!.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
      scenarioIndex: AppConstants.selectedScenarioIndex,
    ),
    instanceName: 'scenario',
  );
}
