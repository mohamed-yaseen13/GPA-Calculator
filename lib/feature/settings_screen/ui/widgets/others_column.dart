import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/rate_app_row.dart';

class OthersColumn extends StatelessWidget {
  const OthersColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, left: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Others',
            style: TextStyle(fontSize: 16.sp, color: AppColors.mainOrange),
          ),
          verticalSpace(12),
          RateAppRow(),
        ],
      ),
    );
  }
}
