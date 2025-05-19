import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/semester/course/data/models/course_model.dart';

class SemesterModel {
  String name;

  final double gpa;

  final List<CourseModel> courses;

  bool selected;

  SemesterModel({
    required this.courses,
    required this.gpa,
    required this.name,
    required this.selected,
  });

  @override
  String toString() {
    return 'SemesterModel(name: $name, gpa: $gpa, selected: $selected, courses: $courses)';
  }
}
