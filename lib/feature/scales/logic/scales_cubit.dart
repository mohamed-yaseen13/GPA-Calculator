import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScalesCubit extends Cubit<ScalesState> {
  static const String _selectedIndexKey = 'selected_scale_index';

  ScalesCubit() : super(const ScalesState(selectedIndex: null)) {
    _loadSelectedIndex();
    loadCustomScales();
  }

  Future<void> loadCustomScales() async {
    final customScales = await PrefsHelper.loadCustomScales();
    emit(state.copyWith(customScales: customScales));
  }

  Future<void> selectScale(int index) async {
    final current = state.selectedIndex;
    final newIndex = current == index ? null : index;

    emit(state.copyWith(selectedIndex: newIndex));
    final prefs = await SharedPreferences.getInstance();
    if (newIndex != null) {
      await prefs.setInt(_selectedIndexKey, newIndex);
    } else {
      await prefs.remove(_selectedIndexKey);
    }
  }

  Future<void> _loadSelectedIndex() async {
    final savedIndex = await PrefsHelper.getSelectedScaleIndex();
    emit(state.copyWith(selectedIndex: savedIndex));
  }

  void toggleExpanded(int index) {
    final current = state.isExpandedMap[index] ?? false;
    final updatedMap = Map<int, bool>.from(state.isExpandedMap)
      ..[index] = !current;

    emit(state.copyWith(isExpandedMap: updatedMap));
  }

  void addCustomScale(Map<String, dynamic> scale, {int index = -1}) async {
    final updatedCustomScales = List<Map<String, dynamic>>.from(
      state.customScales,
    );
    if (index != -1) {
      updatedCustomScales[index] = scale;
    } else {
      updatedCustomScales.add(scale);
    }
    emit(state.copyWith(customScales: updatedCustomScales));
    await PrefsHelper.saveCustomScales(updatedCustomScales);
  }

  void deleteScale(int index) async {
    if (index >= 3) {
      final customIndex = index - 3;
      final updatedCustomScales = List<Map<String, dynamic>>.from(
        state.customScales,
      );
      if (customIndex >= 0 && customIndex < updatedCustomScales.length) {
        updatedCustomScales.removeAt(customIndex);
        emit(state.copyWith(customScales: updatedCustomScales));
        await PrefsHelper.saveCustomScales(updatedCustomScales);
      }
    }
  }

  String? validateGrade(String value) {
    if (!RegExp(r'^[A-Za-z\+\-]{1,2}$').hasMatch(value)) {
      return 'Only letters (+/- allowed)';
    }
    return null;
  }

  String? validatePercentile(
    String value,
    int rowIndex,
    List<List<String>> rows,
  ) {
    final parts = value.split('-');
    if (parts.length != 2) return null;
    final first = int.tryParse(parts[0]);
    final second = int.tryParse(parts[1]);
    if (first == null || second == null) return null;
    if (second < first) return 'Second must be >= first';
    return null;
  }

  String? validatePoint(String value) {
    if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) return 'Numbers only';
    return null;
  }

  Future<String?> saveCustomScaleWithValidation(
    String title,
    List<List<String>> rows,
  ) async {
    if (title.isEmpty || rows.isEmpty) return 'Title and rows required';
    for (int i = 0; i < rows.length; i++) {
      final gradeError = validateGrade(rows[i][0]);
      final percError = validatePercentile(rows[i][1], i, rows);
      final pointError = validatePoint(rows[i][2]);
      if (gradeError != null || percError != null || pointError != null) {
        return 'Please fix errors in row ${i + 1}';
      }
    }
    final scale = {'title': title, 'scale': rows};
    await PrefsHelper.saveCustomScale(scale);
    addCustomScale(scale);
    return null;
  }
}
