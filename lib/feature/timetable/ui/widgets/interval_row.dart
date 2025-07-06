import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/timetable/data/models/time_slot_model.dart';
import 'package:gpa_calculator/feature/timetable/logic/cubit/time_table_cubit.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/add_appointment_dialog.dart';

class IntervalRow extends StatelessWidget {
  final String interval;
  final String day;
  final TimeTableCubit cubit;

  const IntervalRow({
    super.key,
    required this.interval,
    required this.day,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(interval, style: TextStyle(fontSize: 16.sp)),
        ),
        Spacer(),
        TextButton(
          onPressed: () async {
            final slot = await showDialog<TimeSlotModel>(
              context: context,
              builder:
                  (_) => AddAppointmentDialog(day: day, interval: interval),
            );
            if (slot != null) {
              cubit.addSlot(slot);
            }
          },
          child: Text(
            'Add',
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
