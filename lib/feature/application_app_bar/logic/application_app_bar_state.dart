import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

part 'application_app_bar_state.freezed.dart';

@freezed
abstract class ApplicationAppBarState with _$ApplicationAppBarState {
  const factory ApplicationAppBarState({
    required bool selectionMode,
    required int selectedItem,
    required List<SemesterModel> semesters,
  }) = _ApplicationAppBarState;
}
