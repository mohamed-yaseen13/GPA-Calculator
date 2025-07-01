import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GpaCalculationsCubit extends Cubit<GpaCalculationsState> {
  final Box box;
  StudentModel student;
  List<List<String>> scale;
  final int? scenarioIndex;

  GpaCalculationsCubit({
    required this.box,
    required this.student,
    required this.scale,
    this.scenarioIndex,
  }) : super(
         GpaCalculationsState(
           cgpa: 0.0,
           totalCredits: 0,
           semesters: List<SemesterModel>.from(student.semesters),
           isThereLimitationsAfterFallOnCourse: false,
           limitationAfterFallOnCourse: null,
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
        if (course.grade == '--') {
          gpaCredits += course.credits;
          continue;
        }
        gpaPoints += getGradePoint(course.grade) * course.credits;
        gpaCredits += course.credits;
        earnedCredits +=
            course.isRepeated ||
                    (course.isChanged &&
                        getGradePoint(course.newGrade) == 0 &&
                        getGradePoint(course.grade) == 0) ||
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
                : course.isChanged && getGradePoint(course.newGrade) != 0
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
          note: semester.note,
        ),
      );
    }

    final updatedStudent = StudentModel(
      cgpa:
          updatedSemesters.isNotEmpty ? updatedSemesters.last.cgpaChanged : 0.0,
      totalCredits: totalCredits.toInt(),
      semesters: updatedSemesters,
    );

    if (scenarioIndex != null) {
      updateScenariosBox(box, scenarioIndex!, updatedStudent);
    } else {
      box.put('default', updatedStudent);
    }

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

  double getMaxGpaPossible(int semesterIndex) {
    double points = 0.0;

    for (var course in state.semesters[semesterIndex].courses) {
      points +=
          course.grade == '--'
              ? getGradePoint(
                    getMaxGradePossible(
                      semesterIndex,
                      state.semesters[semesterIndex].courses.indexOf(course),
                    ),
                  ) *
                  course.credits
              : getGradePoint(course.grade) * course.credits;
    }

    return state.semesters[semesterIndex].attemptedCredits == 0
        ? 0.0
        : points / state.semesters[semesterIndex].attemptedCredits;
  }

  Map<String, dynamic> getCourseWorkScore(int semesterIndex, int courseIndex) {
    double got = 0;
    int from = 0;
    for (var section
        in state.semesters[semesterIndex].courses[courseIndex].sections) {
      got += section.obtainedMark;
      from += section.fullMark;
    }
    return {'got': got, 'from': from};
  }

  String getMaxGradePossible(int semesterIndex, int courseIndex) {
    double? got = getCourseWorkScore(semesterIndex, courseIndex)['got'];
    int? from = getCourseWorkScore(semesterIndex, courseIndex)['from'];

    double maxPercent = (got! + (100 - from!)) / 100 * 100;

    String? maxGrade = '--';

    for (var row in scale) {
      String range = row[1];
      if (range.contains('-')) {
        var parts = range.split('-');
        double min = double.tryParse(parts[0]) ?? 0;
        double max = double.tryParse(parts[1]) ?? 100;
        if (maxPercent >= min && maxPercent <= max) {
          maxGrade = row[0];
        }
      } else if (range.toLowerCase().contains('below')) {
        double below =
            double.tryParse(range.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        if (maxPercent < below) {
          maxGrade = row[0];
        }
      }
    }

    if (state.semesters[semesterIndex].courses[courseIndex].isFailedBefore! &&
        state.isThereLimitationsAfterFallOnCourse &&
        state.limitationAfterFallOnCourse != null) {
      maxGrade =
          getGradePoint(state.limitationAfterFallOnCourse!) >
                  getGradePoint(maxGrade!)
              ? maxGrade
              : state.limitationAfterFallOnCourse;
    }

    return maxGrade!;
  }

  double getMaxCgpaPossible() {
    double points = 0.0;
    double credits = 0.0;

    for (var semester in student.semesters) {
      for (var course in semester.courses) {
        points +=
            course.isChanged
                ? 0.0
                : course.isRepeated
                ? course.grade == '--'
                    ? getGradePoint(
                          getMaxGradePossible(
                            student.semesters.indexOf(semester),
                            student
                                .semesters[student.semesters.indexOf(semester)]
                                .courses
                                .indexOf(course),
                          ),
                        ) *
                        course.credits
                    : getGradePoint(course.grade) * course.credits
                : course.grade == '--'
                ? getGradePoint(
                      getMaxGradePossible(
                        student.semesters.indexOf(semester),
                        student
                            .semesters[student.semesters.indexOf(semester)]
                            .courses
                            .indexOf(course),
                      ),
                    ) *
                    course.credits
                : getGradePoint(course.grade) * course.credits;
        credits += course.isChanged ? 0.0 : course.credits;
      }
    }
    return credits == 0 ? 0.0 : points / credits;
  }

  void changeScale(List<List<String>> newScale) {
    scale = newScale;
    calculateGpaAndCgpa();
  }

  void reloadStudent() {
    final newStudent = AppConstants.student;
    student = newStudent;
    emit(
      state.copyWith(
        semesters: List<SemesterModel>.from(student.semesters),
        cgpa: student.cgpa,
        totalCredits: student.totalCredits,
      ),
    );
  }

  Future<void> enableOrDisableLimitationsAfterFallOnCourse(bool value) async {
    await PrefsHelper.enableOrDisableLimitationAfterFallOnCourse(value);
    emit(state.copyWith(isThereLimitationsAfterFallOnCourse: value));
  }

  Future<void> loadSettings() async {
    final isThereLimitationsAfterFallOnCourse =
        await PrefsHelper.isThereLimitationsAfterFallOnCourse();
    final limitation = await PrefsHelper.getLimitation();

    emit(
      state.copyWith(
        isThereLimitationsAfterFallOnCourse:
            isThereLimitationsAfterFallOnCourse,
        limitationAfterFallOnCourse: limitation,
      ),
    );
  }
}
