import 'package:get_it/get_it.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_cubit.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/tabs/calculator_tab/logic/calculator_cubit.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt(
  int selectedScaleIndex,
  List<Map<String, dynamic>> customScales,
) {
  resetSemesterScreenCubit();

  resetCourseScreenCubit();

  getIt.registerFactory<ScalesCubit>(() => ScalesCubit());

  getIt.registerFactory<GpaCalculationsCubit>(
    () => GpaCalculationsCubit(
      box: AppConstants.box,
      student: AppConstants.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
    )..calculateGpaAndCgpa(),
  );

  getIt.registerLazySingleton<ApplicationAppBarCubit>(
    () => ApplicationAppBarCubit(
      box: AppConstants.box,
      student: AppConstants.student,
    ),
  );

  getIt.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit()..loadSettings(),
  );

  getIt.registerFactory<PasswordCubit>(() => PasswordCubit());

  getIt.registerFactory<ConverterCubit>(() => ConverterCubit());

  getIt.registerFactory<CalculatorCubit>(() => CalculatorCubit());
}

void resetSemesterScreenCubit() {
  if (getIt.isRegistered<SemesterScreenCubit>()) {
    getIt.unregister<SemesterScreenCubit>();
  }
  getIt.registerLazySingleton<SemesterScreenCubit>(
    () => SemesterScreenCubit(
      box: AppConstants.box,
      student: AppConstants.student,
    ),
  );
}

void resetCourseScreenCubit() async {
  if (getIt.isRegistered<CourseScreenCubit>()) {
    getIt.unregister<CourseScreenCubit>();
  }

  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();

  getIt.registerLazySingleton<CourseScreenCubit>(
    () => CourseScreenCubit(
      box: AppConstants.box,
      student: AppConstants.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
    ),
  );
}
