import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/edit_scenario_icon.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenario_button.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenarios_selection.dart';

class ScenariosRowData extends StatelessWidget {
  final int index;
  final ScenarioModel scenario;

  const ScenariosRowData({
    super.key,
    required this.index,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ScenariosSelection(index: index, scenario: scenario),
        ),
        Expanded(
          flex: 7,
          child: ScenarioButton(index: index, scenario: scenario),
        ),
        Expanded(
          flex: 1,
          child: EditScenarioIcon(index: index, scenario: scenario),
        ),
      ],
    );
  }
}
