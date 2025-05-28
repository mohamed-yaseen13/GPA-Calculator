import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

part 'semester_screen_state.freezed.dart';

@freezed
abstract class SemesterScreenState with _$SemesterScreenState {
  const factory SemesterScreenState({
    required String? selectedTerm,
    required int selectedIndex,
    required bool selectionMode,
    required int selectedItem,
    required List<SemesterModel> semesters,
    required List<CourseModel> courses,
    required double? dropdownWidth,
    @Default([]) List<String> grades,
  }) = _SemesterScreenState;
}
