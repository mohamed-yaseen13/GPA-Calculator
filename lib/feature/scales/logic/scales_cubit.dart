import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/scales/logic/scales_state.dart';

class ScalesCubit extends Cubit<ScalesState> {
  ScalesCubit() : super(ScalesState(selectedIndex: null));

  void selectScale(int index) {
    final current = state.selectedIndex;
    final newIndex = current == index ? null : index;

    emit(state.copyWith(selectedIndex: newIndex));
  }

  void toggleExpanded(int index) {
    final current = state.isExpandedMap[index] ?? false;
    final updatedMap = Map<int, bool>.from(state.isExpandedMap)
      ..[index] = !current;

    emit(state.copyWith(isExpandedMap: updatedMap));
  }
}
