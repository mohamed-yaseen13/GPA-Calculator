import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApplicationAppBarCubit extends Cubit<ApplicationAppBarState> {
  final Box box;
  final GpaCalculationsCubit gpaCubit;
  ApplicationAppBarCubit({required this.box, required this.gpaCubit})
    : super(
        ApplicationAppBarState(
          selectionMode: false,
          selectedItem: 0,
          semesters: List<SemesterModel>.from(gpaCubit.student.semesters),
          student: gpaCubit.student,
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
    final updatedSemesters = List<SemesterModel>.from(state.semesters)
      ..removeWhere((semester) => semester.selected);

    gpaCubit.student.semesters = updatedSemesters;
    gpaCubit.calculateGpaAndCgpa();

    box.put('default', gpaCubit.student);

    emit(
      state.copyWith(
        selectedItem: 0,
        selectionMode: false,
        semesters: updatedSemesters,
        student: gpaCubit.student,
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

  void addSemester() {
    SemesterModel newSemester = SemesterModel(
      courses: [],
      gpa: 0,
      name: '',
      selected: false,
    );

    final updatedSemesters = List<SemesterModel>.from(
      gpaCubit.student.semesters,
    )..add(newSemester);

    gpaCubit.student.semesters = updatedSemesters;
    gpaCubit.calculateGpaAndCgpa();

    box.put('default', gpaCubit.student);

    emit(
      state.copyWith(semesters: updatedSemesters, student: gpaCubit.student),
    );
  }
}
