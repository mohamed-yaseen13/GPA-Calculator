import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/semester/data/models/semester_model.dart';

class StudentModel {
  final double cgpa;

  final int totalCredits;

  final List<SemesterModel> semesters;

  StudentModel({
    required this.cgpa,
    required this.semesters,
    required this.totalCredits,
  });

  @override
  String toString() {
    return 'StudentModel(cgpa: $cgpa, totalCredits: $totalCredits, semesters: $semesters)';
  }
}
