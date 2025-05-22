import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/main_student_data.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/main_student_semesters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainScreen extends StatelessWidget {
  bool selectionMode;
  final List<SemesterModel> semesters;
  final Function(int) onToggleSelect;

  MainScreen({
    super.key,
    required this.selectionMode,
    required this.semesters,
    required this.onToggleSelect,
  });

  Box box = Hive.box('studentData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainStudentData(box: box),
            verticalSpace(12),
            MainStudentSemesters(
              semesters: semesters,
              selectionMode: selectionMode,
              onToggleSelect: onToggleSelect,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ApplicationAppBarCubit>().addSemester();
        },
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
