import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_body_course_row.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_body_header_row.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_body_logo_and_gpa.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SemesterScreenBody extends StatelessWidget {
  final Box box;
  bool selectionMode;
  int index;
  final Function(int) onToggleSelect;
  final void Function(String? value, int index) onChanged;
  List<TextEditingController> nameControllers;
  List<CourseModel> courses;
  List<TextEditingController> creditControllers;
  List<SemesterModel> semesters;
  List<String> grades;
  void Function() addCourse;

  SemesterScreenBody({
    super.key,
    required this.box,
    required this.selectionMode,
    required this.index,
    required this.onToggleSelect,
    required this.onChanged,
    required this.nameControllers,
    required this.courses,
    required this.creditControllers,
    required this.semesters,
    required this.grades,
    required this.addCourse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SemesterScreenBodyLogoAndGpa(semesters: semesters, index: index),
            SemesterScreenBodyHeaderRow(),
            SemesterScreenBodyCourseRow(
              box: box,
              courses: courses,
              selectionMode: selectionMode,
              onToggleSelect: onToggleSelect,
              nameControllers: nameControllers,
              creditControllers: creditControllers,
              grades: grades,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCourse,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
