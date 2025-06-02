import 'package:get_it/get_it.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

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
