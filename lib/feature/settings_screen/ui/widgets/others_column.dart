import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';

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
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 18.h),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/star.svg',
                    width: 48,
                    height: 48,
                  ),
                  horizontalSpace(24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rate App',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'If you enjoy using GPA Calculator, Please\ntake a moment to rate it',
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
