import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/widgets/banner_ad_widget.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/export_button.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/show_day_container.dart';

class TimeTableBody extends StatelessWidget {
  const TimeTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 16.h, top: 4.h),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...AppConstants.days.asMap().entries.map((entry) {
                    final day = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: ShowDayContainer(day: day),
                    );
                  }),
                  verticalSpace(60),
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ExportButton()],
          ),
          verticalSpace(12),
          const BannerAdWidget(),
          verticalSpace(24),
        ],
      ),
    );
  }
}
