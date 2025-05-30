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
    double totalCredits = 0.0;
    double cgpaPointsOriginal = 0.0;
    double cgpaPointsChanged = 0.0;
    double cgpaCredits = 0.0;
    List<SemesterModel> updatedSemesters = [];

    for (var semester in student.semesters) {
      double gpaPoints = 0.0;
      double gpaCredits = 0.0;
      double earnedCredits = 0.0;

      bool isRepeatedAndChangedFound = false;

      for (var course in semester.courses) {
        if (course.isRepeated && course.isChanged) {
          isRepeatedAndChangedFound = true;
          break;
        }
      }

      if (isRepeatedAndChangedFound) {
        for (var i = student.semesters.indexOf(semester); i >= 0; i--) {
          for (var course in student.semesters[i].courses) {
            if (course.isRepeated) {
              outerloop:
              for (var j = i - 1; j >= 0; j--) {
                for (var oldCourse in student.semesters[j].courses) {
                  if (oldCourse.name.trim().toLowerCase() ==
                      course.name.trim().toLowerCase()) {
                    cgpaPointsOriginal +=
                        getGradePoint(course.grade) * course.credits -
                        getGradePoint(oldCourse.grade) * oldCourse.credits;
                    break outerloop;
                  }
                }
              }
            }
          }
        }
      } else {
        for (var course in semester.courses) {
          if (course.isRepeated) {
            cgpaPointsOriginal = cgpaPointsChanged;
            break;
          }
        }
      }

      for (var course in semester.courses) {
        gpaPoints += getGradePoint(course.grade) * course.credits;
        gpaCredits += course.credits;
        earnedCredits +=
            course.isRepeated ||
                    (course.isChanged && getGradePoint(course.newGrade) == 0) ||
                    (!course.isChanged && getGradePoint(course.grade) == 0)
                ? 0.0
                : course.credits;

        cgpaPointsOriginal +=
            course.isRepeated
                ? 0.0
                : getGradePoint(course.grade) * course.credits;

        cgpaCredits += course.isRepeated ? 0.0 : course.credits;

        cgpaPointsChanged +=
            course.isRepeated
                ? 0.0
                : course.isChanged
                ? getGradePoint(course.newGrade) * course.credits
                : getGradePoint(course.grade) * course.credits;
      }

      totalCredits += earnedCredits;

      double gpa = gpaCredits > 0 ? gpaPoints / gpaCredits : 0.0;

      double cgpaOriginal =
          cgpaCredits > 0 ? cgpaPointsOriginal / cgpaCredits : 0.0;
      double cgpaChanged =
          cgpaCredits > 0 ? cgpaPointsChanged / cgpaCredits : 0.0;

      updatedSemesters.add(
        SemesterModel(
          name: semester.name,
          courses: semester.courses,
          gpa: gpa,
          selected: semester.selected,
          cgpaOriginal: cgpaOriginal,
          cgpaChanged: cgpaChanged,
          attemptedCredits: gpaCredits,
          earnedCredits: earnedCredits,
        ),
      );
    }

    final updatedStudent = StudentModel(
      cgpa:
          updatedSemesters.isNotEmpty ? updatedSemesters.last.cgpaChanged : 0.0,
      totalCredits: totalCredits.toInt(),
      semesters: updatedSemesters,
    );

    box.put('default', updatedStudent);

    emit(
      state.copyWith(
        cgpa: updatedStudent.cgpa,
        totalCredits: totalCredits.toInt(),
        semesters: updatedSemesters,
      ),
    );
  }

  double getGradePoint(String grade) {
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
