import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void printStudentData() {
  Box box2 = Hive.box('studentData');
  print('studentData box contents:');
  for (var key in box2.keys) {
    print('key: $key, value: ${box2.get(key)}');
  }
}

double getMaxSemesterNameWidth(List<SemesterModel> semesters, TextStyle style) {
  double maxWidth = 0;
  for (var semester in semesters) {
    final tp = TextPainter(
      text: TextSpan(text: semester.name, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    if (tp.size.width > maxWidth) maxWidth = tp.size.width;
  }
  return maxWidth;
}
