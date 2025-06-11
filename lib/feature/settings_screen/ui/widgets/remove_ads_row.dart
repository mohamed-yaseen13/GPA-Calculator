import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/purchase_service.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';

class RemoveAdsRow extends StatelessWidget {
  const RemoveAdsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await PurchaseService.buyRemoveAds();
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
                  'Remove ADs',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('Remove all ads from the app.', maxLines: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
