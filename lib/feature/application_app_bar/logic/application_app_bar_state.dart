import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';

part 'application_app_bar_state.freezed.dart';

@freezed
abstract class ApplicationAppBarState with _$ApplicationAppBarState {
  const factory ApplicationAppBarState({
    required bool selectionMode,
    required int selectedItem,
    required List<SemesterModel> semesters,
    required StudentModel student,
  }) = _ApplicationAppBarState;
}
