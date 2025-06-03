import 'package:get_it/get_it.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_cubit.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/tabs/mark_conventer_tab/logic/converter_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt(
  int selectedScaleIndex,
  List<Map<String, dynamic>> customScales,
) {
  resetSemesterScreenCubit();

  getIt.registerLazySingleton<CourseScreenCubit>(
    () => CourseScreenCubit(
      box: AppConstants.box,
      student: AppConstants.student,
      scale: Scales.getAllScales(customScales)[selectedScaleIndex]['scale'],
    ),
  );

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
