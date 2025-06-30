import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'student_model.g.dart';

@HiveType(typeId: 3)
class StudentModel extends HiveObject {
  @HiveField(0)
  double cgpa;

  @HiveField(1)
  int totalCredits;

  @HiveField(2)
  List<SemesterModel> semesters;

  StudentModel({this.cgpa = 0, required this.semesters, this.totalCredits = 0});

  Map<String, dynamic> toJson() => {
    'cgpa': cgpa,
    'totalCredits': totalCredits,
    'semesters': semesters.map((s) => s.toJson()).toList(),
  };

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    cgpa: (json['cgpa'] as num).toDouble(),
    totalCredits: json['totalCredits'] as int,
    semesters:
        (json['semesters'] as List)
            .map((s) => SemesterModel.fromJson(s as Map<String, dynamic>))
            .toList(),
  );

  StudentModel copyWith({
    double? cgpa,
    int? totalCredits,
    List<SemesterModel>? semesters,
  }) {
    return StudentModel(
      cgpa: cgpa ?? this.cgpa,
      totalCredits: totalCredits ?? this.totalCredits,
      semesters:
          semesters != null
              ? List<SemesterModel>.from(semesters)
              : List<SemesterModel>.from(this.semesters),
    );
  }
}
