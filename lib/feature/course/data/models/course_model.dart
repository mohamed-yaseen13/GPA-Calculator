import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'course_model.g.dart';

@HiveType(typeId: 3)
class CourseModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String grade;

  @HiveField(2)
  double credits;

  @HiveField(3)
  bool selected;

  @HiveField(4)
  bool isRepeated;

  @HiveField(5)
  bool isChanged;

  @HiveField(6)
  String newGrade;

  @HiveField(7)
  List<SectionModel> sections;

  CourseModel({
    required this.credits,
    required this.grade,
    required this.name,
    this.selected = false,
    this.isRepeated = false,
    this.isChanged = false,
    this.newGrade = '--',
    List<SectionModel>? sections,
  }) : sections = sections ?? [];

  Map<String, dynamic> toJson() => {
    'name': name,
    'grade': grade,
    'credits': credits,
    'selected': selected,
    'isRepeated': isRepeated,
    'isChanged': isChanged,
    'newGrade': newGrade,
    'sections': sections.map((s) => s.toJson()).toList(),
  };

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    name: json['name'] as String,
    grade: json['grade'] as String,
    credits: (json['credits'] as num).toDouble(),
    selected: json['selected'] as bool,
    isRepeated: json['isRepeated'] as bool,
    isChanged: json['isChanged'] as bool,
    newGrade: json['newGrade'] as String,
    sections:
        (json['sections'] as List)
            .map((s) => SectionModel.fromJson(s as Map<String, dynamic>))
            .toList(),
  );
}
