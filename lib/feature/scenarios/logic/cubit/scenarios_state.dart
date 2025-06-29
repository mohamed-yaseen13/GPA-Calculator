import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';

part 'scenarios_state.freezed.dart';

@freezed
abstract class ScenariosState with _$ScenariosState {
  const factory ScenariosState({
    required List<ScenarioModel> scenarios,
    required bool selectionMode,
    required int selectedScenarios,
  }) = _ScenariosState;
}
