import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:in_app_review/in_app_review.dart';

class RateAppRow extends StatelessWidget {
  const RateAppRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await rateApp();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, bottom: 18.h),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/star.svg', width: 48, height: 48),
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
                const Text(
                  'If you enjoy using GPA Calculator, Please\ntake a moment to rate it',
                  maxLines: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> rateApp() async {
  final inAppReview = InAppReview.instance;

  if (await inAppReview.isAvailable()) {
    await inAppReview.requestReview();
  } else {
    await inAppReview.openStoreListing();
  }
}
