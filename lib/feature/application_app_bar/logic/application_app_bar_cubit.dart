import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApplicationAppBarCubit extends Cubit<ApplicationAppBarState> {
  final Box box;
  final StudentModel student;
  ApplicationAppBarCubit({required this.box, required this.student})
    : super(
        ApplicationAppBarState(
          selectionMode: false,
          selectedItem: 0,
          semesters: List<SemesterModel>.from(student.semesters),
          student: student,
        ),
      );

  void select() => emit(state.copyWith(selectionMode: true));

  void cancelSelection() {
    for (var semester in state.semesters) {
      semester.selected = false;
    }
    emit(state.copyWith(selectionMode: false, selectedItem: 0));
  }

  void selectAll() {
    bool allSelected = state.semesters.every((s) => s.selected);
    for (var semester in state.semesters) {
      semester.selected = !allSelected;
    }
    emit(
      state.copyWith(selectedItem: allSelected ? 0 : state.semesters.length),
    );
  }

  void deleteSelected() {
    final updatedSemesters = List<SemesterModel>.from(state.semesters);

    for (var semester in updatedSemesters.where(
      (semester) => semester.selected,
    )) {
      for (var course in semester.courses) {
        if (course.isRepeated) {
          checkIfCourseIsRepeatedAtDelete(
            course,
            student.semesters.indexOf(semester),
          );
        }
      }
    }

    updatedSemesters.removeWhere((semester) => semester.selected);
    student.semesters
      ..clear()
      ..addAll(updatedSemesters);
    box.put('default', student);
    emit(
      state.copyWith(
        selectedItem: 0,
        selectionMode: false,
        semesters: updatedSemesters,
        student: student,
      ),
    );
  }

  void toggleSelect(int index) {
    state.semesters[index].selected = !state.semesters[index].selected;
    emit(
      state.copyWith(
        selectedItem: state.semesters.where((s) => s.selected).length,
      ),
    );
  }

  void addSemester({required String name}) {
    SemesterModel newSemester = SemesterModel(
      courses: [],
      gpa: 0,
      name: name,
      selected: false,
    );

    student.semesters.add(newSemester);

    box.put('default', student);

    emit(
      state.copyWith(
        semesters: List<SemesterModel>.from(student.semesters),
        student: student,
      ),
    );
  }

  void checkIfCourseIsRepeatedAtDelete(
    CourseModel courseToDelete,
    int currentIndex,
  ) {
    final currentSemesters = student.semesters;

    if (currentIndex == 0) return;

    for (int i = currentIndex - 1; i >= 0; i--) {
      for (var oldCourse in currentSemesters[i].courses) {
        if (oldCourse.name.trim().toLowerCase() ==
            courseToDelete.name.trim().toLowerCase()) {
          oldCourse.isChanged = false;

          box.put('default', student);

          return;
        }
      }
    }
  }
}
