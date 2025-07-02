import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/all_semesters_table.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  late Map? args;
  late ScenarioModel scenario;

  bool _didSetInitialCourse = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_didSetInitialCourse) {
      args = ModalRoute.of(context)!.settings.arguments as Map?;
      int? scenarioIndex = args?['scenarioIndex'];

      scenario = AppConstants.scenariosBox.getAt(scenarioIndex!);

      _didSetInitialCourse = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Import To ${scenario.name} Scenario')),
      body: AllSemestersTable(),
    );
  }
}
