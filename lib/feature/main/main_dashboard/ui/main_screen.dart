import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/main/main_dashboard/ui/widgets/main_student_data.dart';
import 'package:gpa_calculator/feature/main/main_dashboard/ui/widgets/main_student_semesters.dart';

class MainScreen extends StatelessWidget {
  final List<Map<String, dynamic>> semesters;
  final bool selectionMode;
  final Function(int) onToggleSelect;
  final VoidCallback onAddSemester;

  const MainScreen({
    super.key,
    required this.semesters,
    required this.onAddSemester,
    required this.onToggleSelect,
    required this.selectionMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainStudentData(),
            verticalSpace(12),
            MainStudentSemesters(
              semesters: semesters,
              selectionMode: selectionMode,
              onToggleSelect: onToggleSelect,
              onAddSemester: onAddSemester,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddSemester,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
