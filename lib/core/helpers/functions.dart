import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void printStudentData() {
  Box box2 = Hive.box('studentData');
  print('studentData box contents:');
  for (var key in box2.keys) {
    print('key: $key, value: ${box2.get(key)}');
  }
}

double getMaxSemesterNameWidth(List<SemesterModel> semesters) {
  double maxWidth1 = 0;

  for (var semester in semesters) {
    if (semester.name.isEmpty) {
      maxWidth1 = 130;
    }
  }

  double maxWidth2 = 0;
  for (var semester in semesters) {
    final tp = TextPainter(
      text: TextSpan(
        text: semester.name,
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    if (tp.size.width > maxWidth2) maxWidth2 = tp.size.width;
  }

  if (maxWidth1 < maxWidth2) {
    return maxWidth2 + 32.w;
  }

  return maxWidth1;
}
