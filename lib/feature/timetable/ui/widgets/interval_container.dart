import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/timetable/logic/cubit/time_table_cubit.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/interval_row.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/slot_row.dart';

class IntervalContainer extends StatelessWidget {
  final String interval;
  final String day;

  const IntervalContainer({
    super.key,
    required this.interval,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TimeTableCubit>();

    final matchingSlots =
        cubit.state.slots.where((s) {
          return s.day == day && s.interval == interval;
        }).toList();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntervalRow(cubit: cubit, day: day, interval: interval),
          verticalSpace(4),
          if (matchingSlots.isNotEmpty)
            ...matchingSlots.map(
              (slot) => Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: SlotRow(
                  cubit: cubit,
                  day: day,
                  interval: interval,
                  slot: slot,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
