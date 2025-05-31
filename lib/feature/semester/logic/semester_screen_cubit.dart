import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SemesterScreenCubit extends Cubit<SemesterScreenState> {
  final Box box;
  final StudentModel student;

  SemesterScreenCubit({required this.box, required this.student})
    : super(
        SemesterScreenState(
          selectedIndex: 0,
          selectionMode: false,
          selectedItem: 0,
          semesters: List<SemesterModel>.from(student.semesters),
          courses: List<CourseModel>.from(student.semesters[0].courses),
          selectedTerm: null,
          dropdownWidth: null,
          grades: const [],
        ),
      ) {
    loadGrades();
  }

  Future<void> loadGrades() async {
    final grades = await AppConstants.grades;
    emit(state.copyWith(grades: grades));
  }

  void select() => emit(state.copyWith(selectionMode: true));

  void cancelSelection() {
    for (var course in state.courses) {
      course.selected = false;
    }
    emit(state.copyWith(selectionMode: false, selectedItem: 0));
  }

  void selectAll() {
    bool allSelected = state.courses.every((course) => course.selected);
    for (var course in state.courses) {
      course.selected = !allSelected;
    }
    emit(state.copyWith(selectedItem: allSelected ? 0 : state.courses.length));
  }

  void deleteSelected() {
    final updatedCourses = List<CourseModel>.from(state.courses);

    for (var course in updatedCourses.where((c) => c.selected)) {
      checkIfCourseIsRepeatedAtDelete(course);
    }
    updatedCourses.removeWhere((course) => course.selected);
    student.semesters[state.selectedIndex].courses
      ..clear()
      ..addAll(updatedCourses);
    box.put('default', student);
    emit(
      state.copyWith(
        selectedItem: 0,
        selectionMode: false,
        courses: updatedCourses,
      ),
    );
  }

  void toggleSelect(int index) {
    state.courses[index].selected = !state.courses[index].selected;
    emit(
      state.copyWith(
        selectedItem: state.courses.where((course) => course.selected).length,
      ),
    );
  }

  void changeTerm(int? index) {
    if (index == null) return;

    final selectedSemester = state.semesters[index];
    emit(
      state.copyWith(
        selectedIndex: index,
        selectedTerm: selectedSemester.name,
        courses: List<CourseModel>.from(selectedSemester.courses),
      ),
    );
  }

  void changeCourseGrade(String? value, int index) {
    if (value == null) return;

    final updatedCourses = List<CourseModel>.from(state.courses);

    final oldCourse = updatedCourses[index];

    updatedCourses[index] = CourseModel(
      name: oldCourse.name,
      grade: value,
      selected: oldCourse.selected,
      credits: oldCourse.credits,
    );

    student.semesters[state.selectedIndex].courses
      ..clear()
      ..addAll(updatedCourses);

    box.put('default', student);
    emit(state.copyWith(courses: updatedCourses));
  }

  void setSemesterByIndex(int? index) {
    if (index == null) return;
    final semesters = state.semesters;
    if (index < 0 || index >= semesters.length) return;
    final selectedTerm = semesters[index].name;
    final courses = semesters[index].courses;
    final dropdownWidth = getMaxSemesterNameWidth(semesters);
    emit(
      state.copyWith(
        selectedTerm: selectedTerm,
        selectedIndex: index,
        courses: List<CourseModel>.from(courses),
        dropdownWidth: dropdownWidth,
      ),
    );
  }

  void addCourse({
    required String name,
    required double credits,
    required String grade,
    int index = -1,
  }) {
    if (index != -1) {
      student.semesters[state.selectedIndex].courses[index] = CourseModel(
        credits: credits,
        grade: grade,
        name: name,
        sections:
            student.semesters[state.selectedIndex].courses[index].sections,
      );

      checkAndMarkRepeatedCourse(
        student.semesters[state.selectedIndex].courses[index],
      );

      box.put('default', student);
    } else {
      CourseModel newCourse = CourseModel(
        name: name,
        selected: false,
        credits: credits,
        grade: grade,
      );

      student.semesters[state.selectedIndex].courses.add(newCourse);
      checkAndMarkRepeatedCourse(newCourse);
    }
    box.put('default', student);

    emit(
      state.copyWith(
        courses: List<CourseModel>.from(
          student.semesters[state.selectedIndex].courses,
        ),
      ),
    );
  }

  void checkAndMarkRepeatedCourse(CourseModel newCourse) {
    final currentIndex = state.selectedIndex;
    final currentSemesters = student.semesters;

    if (currentIndex == 0) return;

    for (int i = 0; i < currentIndex; i++) {
      for (var oldCourse in currentSemesters[i].courses) {
        if (oldCourse.name.trim().toLowerCase() ==
            newCourse.name.trim().toLowerCase()) {
          oldCourse.isChanged = true;

          oldCourse.newGrade =
              oldCourse.isRepeated
                  ? '--'
                  : newCourse.grade == '--'
                  ? oldCourse.grade
                  : newCourse.grade;

          newCourse.isRepeated = true;

          box.put('default', student);
        }
      }
    }
  }

  void checkIfCourseIsRepeatedAtDelete(CourseModel courseToDelete) {
    final currentIndex = state.selectedIndex;
    final currentSemesters = student.semesters;

    if (currentIndex == 0) return;

    String grade;

    for (int i = currentIndex - 1; i >= 0; i--) {
      for (var oldCourse in currentSemesters[i].courses) {
        if (oldCourse.name.trim().toLowerCase() ==
            courseToDelete.name.trim().toLowerCase()) {
          oldCourse.isChanged = false;
          grade = oldCourse.grade;
          for (var j = i - 1; j >= 0; j--) {
            for (var olderCourse in currentSemesters[j].courses) {
              if (olderCourse.name.trim().toLowerCase() ==
                  courseToDelete.name.trim().toLowerCase()) {
                olderCourse.newGrade = grade;
              }
            }
          }
          box.put('default', student);
          return;
        }
      }
    }
  }
}
