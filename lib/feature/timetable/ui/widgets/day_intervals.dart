import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/interval_container.dart';

class DayIntervals extends StatelessWidget {
  final String day;

  const DayIntervals({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
        child: Column(
          children: [
            ...AppConstants.intervals.asMap().entries.map((entry) {
              final interval = entry.value;
              return Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: IntervalContainer(interval: interval, day: day),
              );
            }),
          ],
        ),
      ),
    );
  }
}
