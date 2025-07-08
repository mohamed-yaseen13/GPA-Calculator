import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_state.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScenariosCubit extends Cubit<ScenariosState> {
  final Box scenariosBox;

  ScenariosCubit({required this.scenariosBox})
    : super(
        ScenariosState(
          scenarios: List<ScenarioModel>.from(scenariosBox.values),
          selectionMode: false,
          selectedScenarios: 0,
        ),
      );

  void select() => emit(state.copyWith(selectionMode: true));

  void cancelSelection() {
    for (var scenario in state.scenarios) {
      scenario.selected = false;
    }
    emit(state.copyWith(selectionMode: false, selectedScenarios: 0));
  }

  void selectAll() {
    bool allSelected = state.scenarios.every((scenario) => scenario.selected);
    for (var scenario in state.scenarios) {
      scenario.selected = !allSelected;
    }
    emit(
      state.copyWith(
        selectedScenarios: allSelected ? 0 : state.scenarios.length,
      ),
    );
  }

  void toggleSelect(int index) {
    state.scenarios[index].selected = !state.scenarios[index].selected;
    emit(
      state.copyWith(
        selectedScenarios:
            state.scenarios.where((scenario) => scenario.selected).length,
      ),
    );
  }

  void deleteSelected() async {
    final updatedScenarios = List<ScenarioModel>.from(state.scenarios);

    updatedScenarios.removeWhere((scenario) => scenario.selected);

    await scenariosBox.clear();

    await scenariosBox.addAll(
      updatedScenarios.map((s) => s.copyWithoutHiveRefs()).toList(),
    );

    emit(state.copyWith(scenarios: updatedScenarios));
  }

  void addScenario({required String name, int index = -1}) {
    final updatedScenarios = List<ScenarioModel>.from(state.scenarios);

    if (index != -1) {
      final old = updatedScenarios[index];
      final updated = ScenarioModel(name: name, student: old.student);
      updatedScenarios[index] = updated;

      scenariosBox.putAt(index, updated);
    } else {
      final newScenario = ScenarioModel(
        name: name,
        student: StudentModel(semesters: []),
      );
      updatedScenarios.add(newScenario);

      scenariosBox.add(newScenario);
    }

    emit(state.copyWith(scenarios: updatedScenarios));
  }
}
