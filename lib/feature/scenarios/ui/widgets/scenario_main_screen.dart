import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenario_screen_app_bar.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/main_screen.dart';

class ScenarioMainScreen extends StatelessWidget {
  const ScenarioMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationAppBarCubit>(
          create: (_) => getCubit<ApplicationAppBarCubit>(),
        ),
        BlocProvider(create: (_) => getCubit<GpaCalculationsCubit>()),
      ],
      child: Scaffold(
        appBar: ScenarioScreenAppBar(
          scenarioName: AppConstants.selectedScenario!.name,
        ),
        body: MainScreen(),
      ),
    );
  }
}
