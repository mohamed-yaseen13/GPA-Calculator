import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'scenario_model.g.dart';

@HiveType(typeId: 4)
class ScenarioModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool selected;

  @HiveField(2)
  StudentModel student;

  ScenarioModel({
    required this.name,
    this.selected = false,
    StudentModel? student,
  }) : student = student ?? StudentModel(semesters: []);

  Map<String, dynamic> toJson() => {
    'name': name,
    'selected': selected,
    'student': student.toJson(),
  };

  factory ScenarioModel.fromJson(Map<String, dynamic> json) => ScenarioModel(
    name: json['name'] as String,
    selected: json['selected'] as bool,
    student: StudentModel.fromJson(json['student']),
  );

  ScenarioModel copyWith({
    String? name,
    bool? selected,
    StudentModel? student,
  }) {
    return ScenarioModel(
      name: name ?? this.name,
      selected: selected ?? this.selected,
      student: student ?? this.student,
    );
  }
}
