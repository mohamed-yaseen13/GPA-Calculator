import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_data_data_column.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_data_text_column.dart';

class SemesterData extends StatelessWidget {
  const SemesterData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 8.h, left: 16.w, right: 32.w),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SemesterDataTextColumn(),
              Spacer(),
              SemesterDataDataColumn(),
            ],
          ),
        ),
      ),
    );
  }
}
