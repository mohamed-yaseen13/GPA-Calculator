import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';

part 'course_screen_state.freezed.dart';

@freezed
abstract class CourseScreenState with _$CourseScreenState {
  const factory CourseScreenState({
    required String? selectedCourseName,
    required int selectedTermIndex,
    required int selectedCourseIndex,
    required bool selectionMode,
    required int selectedSections,
    required List<CourseModel> courses,
    required List<SectionModel> sections,
    required double? dropdownWidth,
    required bool isThereLimitationsAfterFallOnCourse,
    required String? limitationAfterFallOnCourse,
  }) = _CourseScreenState;
}
