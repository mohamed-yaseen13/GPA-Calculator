import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainStudentData extends StatelessWidget {
  final Box box;
  const MainStudentData({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    StudentModel student = box.get('default');

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
              Text('Cumulative GPA: ', style: TextStyle(fontSize: 18.sp)),
              Text('Total Credits: ', style: TextStyle(fontSize: 18.sp)),
            ],
          ),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${student.cgpa}', style: TextStyle(fontSize: 18.sp)),
              Text(
                '${student.totalCredits}',
                style: TextStyle(fontSize: 18.sp, color: AppColors.mainOrange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
