import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenario_screen_app_bar.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/main_screen.dart';

class ScenarioMainScreen extends StatefulWidget {
  final ScenarioModel scenario;
  final int index;

  const ScenarioMainScreen({
    super.key,
    required this.scenario,
    required this.index,
  });

  @override
  State<ScenarioMainScreen> createState() => _ScenarioMainScreenState();
}

class _ScenarioMainScreenState extends State<ScenarioMainScreen> {
  late List<Map<String, dynamic>> customScales;
  late int selectedScaleIndex;
  late List<List<String>> scale;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadScales();
  }

  void _loadScales() async {
    customScales = await PrefsHelper.loadCustomScales();
    selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
    scale = Scales.getAllScales(customScales)[selectedScaleIndex]['scale'];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationAppBarCubit>(
          create:
              (_) => ApplicationAppBarCubit(
                box: AppConstants.scenariosBox,
                student: widget.scenario.student,
                scenarioIndex: widget.index,
              ),
        ),
        BlocProvider<SemesterScreenCubit>(
          create:
              (_) => SemesterScreenCubit(
                box: AppConstants.scenariosBox,
                student: widget.scenario.student,
                scale: scale,
              ),
        ),
        BlocProvider<CourseScreenCubit>(
          create:
              (_) => CourseScreenCubit(
                box: AppConstants.scenariosBox,
                student: widget.scenario.student,
                scale: scale,
              )..loadSettings(),
        ),
        BlocProvider(
          create:
              (_) => GpaCalculationsCubit(
                box: AppConstants.scenariosBox,
                student: widget.scenario.student,
                scale: scale,
                scenarioIndex: widget.index,
              ),
        ),
      ],
      child: Scaffold(
        appBar: ScenarioScreenAppBar(scenarioName: widget.scenario.name),
        body: MainScreen(),
      ),
    );
  }
}
