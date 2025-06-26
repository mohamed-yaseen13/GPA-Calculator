import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_state.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive/hive.dart';

class CourseScreenCubit extends Cubit<CourseScreenState> {
  final Box box;
  final StudentModel student;
  List<List<String>> scale;

  CourseScreenCubit({
    required this.box,
    required this.student,
    required this.scale,
  }) : super(
         CourseScreenState(
           selectedCourseName: null,
           selectedTermIndex: 0,
           selectedCourseIndex: 0,
           selectionMode: false,
           selectedSections: 0,
           courses:
               student.semesters.isNotEmpty
                   ? List<CourseModel>.from(student.semesters[0].courses)
                   : [],
           sections:
               (student.semesters.isNotEmpty &&
                       student.semesters[0].courses.isNotEmpty)
                   ? List<SectionModel>.from(
                     student.semesters[0].courses[0].sections,
                   )
                   : [],
           dropdownWidth: null,
           isThereLimitationsAfterFallOnCourse: false,
           limitationAfterFallOnCourse: null,
         ),
       );

  void select() => emit(state.copyWith(selectionMode: true));

  void cancelSelection() {
    for (var sections in state.sections) {
      sections.selected = false;
    }
    emit(state.copyWith(selectionMode: false, selectedSections: 0));
  }

  void selectAll() {
    bool allSelected = state.sections.every((section) => section.selected);
    for (var section in state.sections) {
      section.selected = !allSelected;
    }
    emit(
      state.copyWith(selectedSections: allSelected ? 0 : state.sections.length),
    );
  }

  void deleteSelected() {
    final updatedSections = List<SectionModel>.from(state.sections);

    updatedSections.removeWhere((section) => section.selected);
    student
        .semesters[state.selectedTermIndex]
        .courses[state.selectedCourseIndex]
        .sections
      ..clear()
      ..addAll(updatedSections);
    box.put('default', student);
    emit(
      state.copyWith(
        selectedSections: 0,
        selectionMode: false,
        sections: updatedSections,
      ),
    );
  }

  void toggleSelect(int index) {
    state.sections[index].selected = !state.sections[index].selected;
    emit(
      state.copyWith(
        selectedSections:
            state.sections.where((section) => section.selected).length,
      ),
    );
  }

  void changeCourse(int? index) {
    if (index == null) return;

    final selectedCourse = state.courses[index];
    emit(
      state.copyWith(
        selectedCourseIndex: index,
        selectedCourseName: selectedCourse.name,
        sections: List<SectionModel>.from(selectedCourse.sections),
      ),
    );
  }

  void setCourseByIndex(int? index) {
    if (index == null) return;
    final courses = state.courses;
    if (index < 0 || index >= courses.length) return;
    final selectedCourse = courses[index].name;
    final sections = courses[index].sections;
    final dropdownWidth = getMaxSemesterNameWidth(courses);
    emit(
      state.copyWith(
        selectedCourseName: selectedCourse,
        selectedCourseIndex: index,
        sections: List<SectionModel>.from(sections),
        dropdownWidth: dropdownWidth,
      ),
    );
  }

  void setSelectedTermIndex(int? index) {
    if (index == null) return;
    if (index < 0 || index >= student.semesters.length) return;
    emit(
      state.copyWith(
        selectedTermIndex: index,
        courses: List<CourseModel>.from(student.semesters[index].courses),
        selectedCourseIndex: 0,
        sections: List<SectionModel>.from(
          student.semesters[index].courses[0].sections,
        ),
        selectedCourseName: student.semesters[index].courses[0].name,
      ),
    );
  }

  void addSection({
    required String name,
    required double obtainedMark,
    required double fullMark,
    int index = -1,
  }) {
    if (index != -1) {
      student
          .semesters[state.selectedTermIndex]
          .courses[state.selectedCourseIndex]
          .sections[index] = SectionModel(
        name: name,
        obtainedMark: obtainedMark,
        fullMark: fullMark.toInt(),
      );

      box.put('default', student);
    } else {
      SectionModel newSection = SectionModel(
        name: name,
        selected: false,
        obtainedMark: obtainedMark,
        fullMark: fullMark.toInt(),
      );

      student
          .semesters[state.selectedTermIndex]
          .courses[state.selectedCourseIndex]
          .sections
          .add(newSection);
    }
    box.put('default', student);

    emit(
      state.copyWith(
        sections: List<SectionModel>.from(
          student
              .semesters[state.selectedTermIndex]
              .courses[state.selectedCourseIndex]
              .sections,
        ),
      ),
    );
  }

  Map<String, dynamic> getCourseWorkScore() {
    double got = 0;
    int from = 0;
    for (var section in state.sections) {
      got += section.obtainedMark;
      from += section.fullMark;
    }
    return {'got': got, 'from': from};
  }

  double getGradePoint(String grade) {
    for (var row in scale) {
      if (row[0] == grade) return double.tryParse(row[2]) ?? 0.0;
    }
    return 0.0;
  }

  String getMaxGradePossible() {
    double? got = getCourseWorkScore()['got'];
    int? from = getCourseWorkScore()['from'];

    double maxPercent = (got! + (100 - from!)) / 100 * 100;

    String? result = '--';

    for (var row in scale) {
      String range = row[1];
      if (range.contains('-')) {
        var parts = range.split('-');
        double min = double.tryParse(parts[0]) ?? 0;
        double max = double.tryParse(parts[1]) ?? 100;
        if (maxPercent >= min && maxPercent <= max) {
          result = row[0];
        }
      } else if (range.toLowerCase().contains('below')) {
        double below =
            double.tryParse(range.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        if (maxPercent < below) {
          result = row[0];
        }
      }
    }

    if (state.courses[state.selectedCourseIndex].isFailedBefore! &&
        state.isThereLimitationsAfterFallOnCourse) {
      result =
          getGradePoint(state.limitationAfterFallOnCourse!) >
                  getGradePoint(result!)
              ? result
              : state.limitationAfterFallOnCourse;
    }

    return result!;
  }

  void changeScale(List<List<String>> newScale) {
    scale = newScale;
    emit(state.copyWith());
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
