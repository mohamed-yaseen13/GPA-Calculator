import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class StudentModel {
  final double cgpa;

  final int totalCredits;

  List<SemesterModel> semesters;

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
