import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'student_model.g.dart';

@HiveType(typeId: 2)
class StudentModel extends HiveObject {
  @HiveField(0)
  double cgpa;

  @HiveField(1)
  int totalCredits;

  @HiveField(2)
  List<SemesterModel> semesters;

  StudentModel({this.cgpa = 0, required this.semesters, this.totalCredits = 0});
}
