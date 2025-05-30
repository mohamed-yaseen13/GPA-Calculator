import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScalesCubit extends Cubit<ScalesState> {
  static const String _selectedIndexKey = 'selected_scale_index';

  ScalesCubit() : super(ScalesState(selectedIndex: null)) {
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

  void addCustomScale(Map<String, dynamic> scale) {
    final updatedCustomScales = List<Map<String, dynamic>>.from(
      state.customScales,
    )..add(scale);
    emit(state.copyWith(customScales: updatedCustomScales));
  }

  String? validateGrade(String value) {
    if (value.length > 2) return 'Max 2 letters';
    if (!RegExp(r'^[A-Za-z\+\-]{1,2}$').hasMatch(value)) {
      return 'Only letters (+/- allowed)';
    }
    return null;
  }

  String? validatePercentile(String value, int row, List<List<String>> rows) {
    if (!RegExp(r'^\d{1,3}-\d{1,3}$').hasMatch(value)) return 'Format: xx-yy';
    final parts = value.split('-');
    final xx = int.tryParse(parts[0]);
    final yy = int.tryParse(parts[1]);
    if (xx == null || yy == null) return 'Invalid numbers';
    if (yy < xx) return 'yy must be >= xx';
    if (row > 0) {
      final prev = rows[row - 1][1];
      if (RegExp(r'^\d{1,3}-\d{1,3}$').hasMatch(prev)) {
        final prevParts = prev.split('-');
        final prevYy = int.tryParse(prevParts[1]);
        if (prevYy != null && xx > prevYy) return 'xx must be <= previous yy';
      }
    }
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
