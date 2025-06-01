import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';

void printStudentData() {
  for (var semester in AppConstants.student!.semesters) {
    print(semester.name);
    print('');
    print('CGPA Original: ${semester.cgpaOriginal}');
    print('');
    print('CGPA Changed: ${semester.cgpaChanged}');

    for (var course in semester.courses) {
      print(
        '${course.name} - repeated: ${course.isRepeated} - changed: ${course.isChanged} - Grade: ${course.grade} - New Grade: ${course.newGrade}',
      );

      for (var section in course.sections) {
        print(
          '${section.name} - ${section.obtainedMark} - ${section.fullMark}',
        );
      }
    }
  }
}

double getMaxSemesterNameWidth(List<dynamic> semesters) {
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
