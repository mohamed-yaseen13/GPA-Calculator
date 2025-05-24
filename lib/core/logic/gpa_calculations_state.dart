import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

part 'gpa_calculations_state.freezed.dart';

@freezed
abstract class GpaCalculationsState with _$GpaCalculationsState {
  const factory GpaCalculationsState({
    required double cgpa,
    required int totalCredits,
    required List<SemesterModel> semesters,
  }) = _GpaCalculationsState;
}
