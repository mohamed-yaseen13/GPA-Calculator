import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/remove_ads_sheet.dart';

class RemoveAdsRow extends StatelessWidget {
  const RemoveAdsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (context) => const RemoveAdsSheet(),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, bottom: 18.h),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/remove_ads.svg',
              width: 48,
              height: 48,
            ),
            horizontalSpace(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Remove Ads',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
