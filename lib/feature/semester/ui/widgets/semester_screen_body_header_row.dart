import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemesterScreenBodyHeaderRow extends StatelessWidget {
  const SemesterScreenBodyHeaderRow({super.key});

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
              'Courses',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Grades',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Credits',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
