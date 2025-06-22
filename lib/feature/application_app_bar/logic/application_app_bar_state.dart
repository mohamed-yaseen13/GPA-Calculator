import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';

part 'application_app_bar_state.freezed.dart';

@freezed
abstract class ApplicationAppBarState with _$ApplicationAppBarState {
  const factory ApplicationAppBarState({
    required StudentModel student,
    required List<SemesterModel> semesters,
    @Default(false) bool selectionMode,
    @Default(0) int selectedItem,
    @Default([]) List<Map<String, dynamic>> searchResults,
    @Default(false) bool showSearchOverlay,
  }) = _ApplicationAppBarState;
}
