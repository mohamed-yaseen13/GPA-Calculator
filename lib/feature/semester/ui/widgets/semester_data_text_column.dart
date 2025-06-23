import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';

class SemesterDataTextColumn extends StatelessWidget {
  const SemesterDataTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Attempted Credits : ', style: TextStyle(fontSize: 18.sp)),
        verticalSpace(12),
        Text('Earned Credits : ', style: TextStyle(fontSize: 18.sp)),
        verticalSpace(12),
        Text('GPA', style: TextStyle(fontSize: 18.sp)),
        verticalSpace(12),
        Text('Max GPA you can get', style: TextStyle(fontSize: 16.sp)),
      ],
    );
  }
}
