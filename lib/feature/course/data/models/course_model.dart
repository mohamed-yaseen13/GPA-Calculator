import 'package:hive_flutter/hive_flutter.dart';

part 'course_model.g.dart';

@HiveType(typeId: 0)
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

  CourseModel({
    required this.credits,
    required this.grade,
    required this.name,
    this.selected = false,
    this.isRepeated = false,
    this.isChanged = false,
    this.newGrade = '--',
  });
}
