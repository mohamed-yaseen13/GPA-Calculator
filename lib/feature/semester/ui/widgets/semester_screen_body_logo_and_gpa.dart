import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class SemesterScreenBodyLogoAndGpa extends StatelessWidget {
  List<SemesterModel> semesters;
  int index;
  SemesterScreenBodyLogoAndGpa({
    super.key,
    required this.semesters,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/graduation_hat_2.svg'),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GPA: ', style: TextStyle(fontSize: 18.sp)),
              Text(
                '${semesters[index].gpa}',
                style: TextStyle(fontSize: 18.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
