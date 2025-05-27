import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainStudentHeader extends StatelessWidget {
  const MainStudentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          SizedBox(
            width: 1.w,
            child: Text('#', style: TextStyle(fontSize: 16.sp)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Semesters',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'GPA',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'CGPA',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
