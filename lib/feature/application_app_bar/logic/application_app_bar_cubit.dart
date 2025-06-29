import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApplicationAppBarCubit extends Cubit<ApplicationAppBarState> {
  final Box box;
  StudentModel student;
  final int? scenarioIndex;

  ApplicationAppBarCubit({
    required this.box,
    required this.student,
    this.scenarioIndex,
  }) : super(
         ApplicationAppBarState(
           student: student,
           semesters: List<SemesterModel>.from(student.semesters),
         ),
       ) {
    print(
      'ApplicationAppBarCubit created! hashCode: $hashCode, scenarioIndex: $scenarioIndex',
    );
    print('[ApplicationAppBarCubit] box.runtimeType: ${box.runtimeType}');
    print(
      '[ApplicationAppBarCubit] student.runtimeType: ${student.runtimeType}',
    );

    print('[ApplicationAppBarCubit] student content: ${student.toJson()}');

    try {
      print('[ApplicationAppBarCubit] box content: ${box.toMap()}');
    } catch (e) {
      print('[ApplicationAppBarCubit] box content (fallback): ${box.keys}');
    }
  }

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

  void addSemester({required String name, int index = -1}) {
    if (index != -1) {
      final oldSemester = student.semesters[index];
      student.semesters[index] = SemesterModel(
        courses: List.from(oldSemester.courses),
        gpa: oldSemester.gpa,
        name: name,
        selected: oldSemester.selected,
      );
    } else {
      SemesterModel newSemester = SemesterModel(
        courses: [],
        gpa: 0,
        name: name,
        selected: false,
      );

      student.semesters.add(newSemester);
    }

    if (scenarioIndex != null) {
      print('Storing The Semester In Scenarios Box');
      final scenariosBox = box;
      final oldScenario = scenariosBox.getAt(scenarioIndex!) as ScenarioModel;
      final updatedScenario = oldScenario.copyWith(student: student);
      scenariosBox.putAt(scenarioIndex!, updatedScenario);
    } else {
      print('Storing The Semester In Main Box');
      box.put('default', student);
    }

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

  void reloadStudent() {
    final newStudent = AppConstants.student;
    student = newStudent;
    emit(
      state.copyWith(
        student: student,
        semesters: List<SemesterModel>.from(student.semesters),
        selectedItem: 0,
        selectionMode: false,
      ),
    );
  }

  void saveSemesterNote(int semesterIndex, String updatedNote) {
    student.semesters[semesterIndex].note = updatedNote;

    box.put('default', student);

    emit(
      state.copyWith(semesters: List<SemesterModel>.from(student.semesters)),
    );
  }

  void searchOnCourse(String query) {
    final lowerQuery = query.toLowerCase();
    final results = <Map<String, dynamic>>[];

    if (query.isNotEmpty) {
      for (int i = 0; i < state.semesters.length; i++) {
        final semester = state.semesters[i];
        for (final course in semester.courses) {
          if (course.name.toLowerCase().contains(lowerQuery)) {
            results.add({
              'course': course.name,
              'semester': semester.name,
              'semesterIndex': i,
            });
          }
        }
      }
    }

    emit(
      state.copyWith(
        searchResults: results,
        showSearchOverlay: query.isNotEmpty && results.isNotEmpty,
      ),
    );
  }
}
