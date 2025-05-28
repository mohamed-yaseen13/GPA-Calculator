import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScalesCubit extends Cubit<ScalesState> {
  static const String _selectedIndexKey = 'selected_scale_index';

  ScalesCubit() : super(ScalesState(selectedIndex: null)) {
    _loadSelectedIndex();
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
    final prefs = await SharedPreferences.getInstance();
    final savedIndex = prefs.getInt(_selectedIndexKey);
    if (savedIndex != null) {
      emit(state.copyWith(selectedIndex: savedIndex));
    }
  }

  void toggleExpanded(int index) {
    final current = state.isExpandedMap[index] ?? false;
    final updatedMap = Map<int, bool>.from(state.isExpandedMap)
      ..[index] = !current;

    emit(state.copyWith(isExpandedMap: updatedMap));
  }
}
