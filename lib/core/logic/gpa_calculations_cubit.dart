import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GpaCalculationsCubit extends Cubit<GpaCalculationsState> {
  final Box box;
  final StudentModel student;
  List<List<String>> scale;

  GpaCalculationsCubit({
    required this.box,
    required this.student,
    required this.scale,
  }) : super(
         GpaCalculationsState(
           cgpa: 0.0,
           totalCredits: 0,
           semesters: List<SemesterModel>.from(student.semesters),
         ),
       );

  void calculateGpaAndCgpa() {
    double totalPoints = 0.0;
    double totalCredits = 0.0;
    List<SemesterModel> updatedSemesters = [];

    for (var semester in student.semesters) {
      double semesterPoints = 0.0;
      double semesterCredits = 0.0;

      for (var course in semester.courses) {
        final gradePoint = _getGradePoint(course.grade);
        semesterPoints += gradePoint * course.credits;
        semesterCredits += course.credits;
      }

      double gpa = semesterCredits > 0 ? semesterPoints / semesterCredits : 0.0;
      totalPoints += semesterPoints;
      totalCredits += semesterCredits;

      updatedSemesters.add(
        SemesterModel(
          name: semester.name,
          courses: semester.courses,
          gpa: gpa,
          selected: semester.selected,
        ),
      );
    }

    double cgpa = totalCredits > 0 ? totalPoints / totalCredits : 0.0;

    final updatedStudent = StudentModel(
      cgpa: cgpa,
      totalCredits: totalCredits.toInt(),
      semesters: updatedSemesters,
    );

    box.put('default', updatedStudent);

    emit(
      state.copyWith(
        cgpa: cgpa,
        totalCredits: totalCredits.toInt(),
        semesters: updatedSemesters,
      ),
    );
  }

  double _getGradePoint(String grade) {
    for (var row in scale) {
      if (row[0] == grade) return double.tryParse(row[2]) ?? 0.0;
    }
    return 0.0;
  }

  void changeScale(List<List<String>> newScale) {
    scale = newScale;
    calculateGpaAndCgpa();
  }
}
