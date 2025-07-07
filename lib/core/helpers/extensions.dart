import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension BuildContextExtension on BuildContext {
  T? maybeRead<T extends Object?>() {
    try {
      return read<T>();
    } catch (e) {
      return null;
    }
  }
}

// ScenarioModel
extension ScenarioModelCopy on ScenarioModel {
  ScenarioModel copyWithoutHiveRefs() {
    return ScenarioModel(
      name: name,
      selected: selected,
      student: student.copyWithoutHiveRefs(),
    );
  }
}

// StudentModel
extension StudentModelCopy on StudentModel {
  StudentModel copyWithoutHiveRefs() {
    return StudentModel(
      cgpa: cgpa,
      totalCredits: totalCredits,
      semesters: semesters.map((s) => s.copyWithoutHiveRefs()).toList(),
    );
  }
}

// SemesterModel
extension SemesterModelCopy on SemesterModel {
  SemesterModel copyWithoutHiveRefs() {
    return SemesterModel(
      name: name,
      gpa: gpa,
      courses: courses.map((c) => c.copyWithoutHiveRefs()).toList(),
      selected: selected,
      cgpaOriginal: cgpaOriginal,
      cgpaChanged: cgpaChanged,
      attemptedCredits: attemptedCredits,
      earnedCredits: earnedCredits,
      note: note,
    );
  }
}

// CourseModel
extension CourseModelCopy on CourseModel {
  CourseModel copyWithoutHiveRefs() {
    return CourseModel(
      name: name,
      grade: grade,
      credits: credits,
      selected: selected,
      isRepeated: isRepeated,
      isChanged: isChanged,
      newGrade: newGrade,
      sections: sections.map((s) => s.copyWithoutHiveRefs()).toList(),
      isFailedBefore: isFailedBefore,
    );
  }
}

// SectionModel
extension SectionModelCopy on SectionModel {
  SectionModel copyWithoutHiveRefs() {
    return SectionModel(
      name: name,
      selected: selected,
      obtainedMark: obtainedMark,
      fullMark: fullMark,
    );
  }
}
