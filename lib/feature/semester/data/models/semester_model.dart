import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'semester_model.g.dart';

@HiveType(typeId: 2)
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

  @HiveField(6)
  double attemptedCredits;

  @HiveField(7)
  double earnedCredits;

  @HiveField(8)
  String note;

  SemesterModel({
    required this.courses,
    required this.name,
    this.gpa = 0,
    this.selected = false,
    this.cgpaOriginal = 0,
    this.cgpaChanged = 0,
    this.attemptedCredits = 0,
    this.earnedCredits = 0,
    this.note = '',
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'gpa': gpa,
    'courses': courses.map((c) => c.toJson()).toList(),
    'selected': selected,
    'cgpaOriginal': cgpaOriginal,
    'cgpaChanged': cgpaChanged,
    'attemptedCredits': attemptedCredits,
    'earnedCredits': earnedCredits,
    'note': note,
  };

  factory SemesterModel.fromJson(Map<String, dynamic> json) => SemesterModel(
    name: json['name'] as String,
    gpa: (json['gpa'] as num).toDouble(),
    courses:
        (json['courses'] as List)
            .map((c) => CourseModel.fromJson(c as Map<String, dynamic>))
            .toList(),
    selected: json['selected'] as bool,
    cgpaOriginal: (json['cgpaOriginal'] as num).toDouble(),
    cgpaChanged: (json['cgpaChanged'] as num).toDouble(),
    attemptedCredits: (json['attemptedCredits'] as num).toDouble(),
    earnedCredits: (json['earnedCredits'] as num).toDouble(),
    note: json['note'] as String? ?? '',
  );
}
