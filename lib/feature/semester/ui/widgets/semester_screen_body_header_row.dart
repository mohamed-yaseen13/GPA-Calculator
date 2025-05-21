import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';

class SemesterScreenBodyHeaderRow extends StatelessWidget {
  const SemesterScreenBodyHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('#', style: TextStyle(fontSize: 16.sp)),
          horizontalSpace(32),
          Text('Courses', style: TextStyle(fontSize: 16.sp)),
          horizontalSpace(42),
          Text('Grades', style: TextStyle(fontSize: 16.sp)),
          horizontalSpace(64),
          Text('Creidts', style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
