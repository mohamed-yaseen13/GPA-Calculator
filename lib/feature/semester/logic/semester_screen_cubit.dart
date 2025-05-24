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
  final List<String> grades;
  SemesterScreenCubit({
    required this.box,
    required this.grades,
    required this.student,
  }) : super(
         SemesterScreenState(
           selectedIndex: 0,
           selectionMode: false,
           selectedItem: 0,
           semesters: List<SemesterModel>.from(student.semesters),
           courses: List<CourseModel>.from(student.semesters[0].courses),
           selectedTerm: null,
           dropdownWidth: null,
         ),
       );

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

  void addCourse() {
    CourseModel newCourse = CourseModel(
      name: '',
      selected: false,
      credits: 1,
      grade: '--',
    );

    student.semesters[state.selectedIndex].courses.add(newCourse);

    box.put('default', student);

    emit(
      state.copyWith(
        courses: List<CourseModel>.from(
          student.semesters[state.selectedIndex].courses,
        ),
      ),
    );
  }
}
