import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'semester_model.g.dart';

@HiveType(typeId: 1)
class SemesterModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  double gpa;

  @HiveField(2)
  List<CourseModel> courses;

  @HiveField(3)
  bool selected;

  @HiveField(4)
  double cgpaOriginal;

  @HiveField(5)
  double cgpaChanged;

  SemesterModel({
    required this.courses,
    required this.name,
    this.gpa = 0,
    this.selected = false,
    this.cgpaOriginal = 0,
    this.cgpaChanged = 0,
  });
}
