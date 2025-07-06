import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/timetable/data/models/time_slot_model.dart';
import 'package:gpa_calculator/feature/timetable/logic/cubit/time_table_cubit.dart';
import 'package:gpa_calculator/feature/timetable/ui/widgets/add_appointment_dialog.dart';

class SlotRow extends StatelessWidget {
  final TimeSlotModel slot;
  final String day;
  final String interval;
  final TimeTableCubit cubit;

  const SlotRow({
    super.key,
    required this.slot,
    required this.day,
    required this.interval,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${slot.type}: ${slot.content}',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        TextButton(
          onPressed: () async {
            final updatedSlot = await showDialog<TimeSlotModel>(
              context: context,
              builder:
                  (_) => AddAppointmentDialog(
                    day: day,
                    interval: interval,
                    slot: slot,
                  ),
            );
            if (updatedSlot != null) {
              cubit.updateSlot(slot, updatedSlot);
            }
          },
          child: Text(
            'Edit',
            style: TextStyle(color: Colors.blue, fontSize: 14.sp),
          ),
        ),
        TextButton(
          onPressed: () {
            cubit.deleteSlot(slot);
          },
          child: Text(
            'Delete',
            style: TextStyle(color: Colors.red, fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
