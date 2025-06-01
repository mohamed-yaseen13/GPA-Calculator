import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/gpa_app.dart';

class BlocProviders extends StatelessWidget {
  final int selectedScaleIndex;
  final List<Map<String, dynamic>> customScales;

  const BlocProviders({
    super.key,
    required this.customScales,
    required this.selectedScaleIndex,
  });

  @override
  Widget build(BuildContext context) {
    final scale =
        Scales.getAllScales(customScales)[selectedScaleIndex]['scale'];
    return MultiBlocProvider(
      providers: [
        BlocProvider<GpaCalculationsCubit>(
          create: (_) {
            final cubit = GpaCalculationsCubit(
              box: AppConstants.box,
              student: AppConstants.student!,
              scale: scale,
            );
            cubit.calculateGpaAndCgpa();
            return cubit;
          },
        ),
        BlocProvider(
          create:
              (_) => ApplicationAppBarCubit(
                box: AppConstants.box,
                student: AppConstants.student!,
              ),
        ),
        BlocProvider(
          create:
              (_) => SemesterScreenCubit(
                box: AppConstants.box,
                student: AppConstants.student!,
              ),
        ),
        BlocProvider<CourseScreenCubit>(
          create:
              (_) => CourseScreenCubit(
                box: AppConstants.box,
                student: AppConstants.student!,
                scale: scale,
              ),
        ),
        BlocProvider(create: (_) => ScalesCubit()),
        BlocProvider(create: (_) => SettingsCubit()..loadSettings()),
      ],
      child: GpaApp(
        selectedScaleIndex: selectedScaleIndex,
        customScales: customScales,
      ),
    );
  }
}
