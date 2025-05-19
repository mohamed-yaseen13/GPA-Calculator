import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/ui/widgets/main_student_data.dart';
import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/ui/widgets/main_student_semesters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainScreen extends StatelessWidget {
  bool selectionMode;
  final Function(int) onToggleSelect;

  MainScreen({
    super.key,
    required this.selectionMode,
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
            ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box box, _) {
                return MainStudentSemesters(
                  box: box,
                  selectionMode: selectionMode,
                  onToggleSelect: onToggleSelect,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addSemester();
        },
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}

void addSemester() {
  final box = Hive.box('studentData');
  StudentModel student = box.get('default');

  SemesterModel newSemester = SemesterModel(
    courses: [],
    gpa: 0,
    name: '',
    selected: false,
  );

  student.semesters.add(newSemester);

  box.put('default', student);
}
