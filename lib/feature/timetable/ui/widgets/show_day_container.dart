import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/dot_container.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/day_intervals.dart';

class ShowDayContainer extends StatefulWidget {
  final String day;

  const ShowDayContainer({super.key, required this.day});

  @override
  State<ShowDayContainer> createState() => _ShowDayContainerState();
}

class _ShowDayContainerState extends State<ShowDayContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 36.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.sp),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                horizontalSpace(12),
                DotContainer(isExpanded: isExpanded),
                horizontalSpace(12),
                Text(
                  'Show ${widget.day} Appointments',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) DayIntervals(day: widget.day),
      ],
    );
  }
}
