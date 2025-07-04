import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';
import 'package:gpa_calculator/table_calendar/lib/table_calendar.dart';

Future<void> showCopyCalendarDialog({
  required BuildContext context,
  required EventModel originalEvent,
  required Function(DateTime) onPaste,
}) async {
  DateTime? selectedDay;

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Select day to paste'),
            content: SizedBox(
              height: 350.h,
              width: double.maxFinite,
              child: TableCalendar(
                rowHeight: 32.h,
                startingDayOfWeek: StartingDayOfWeek.saturday,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                focusedDay: selectedDay ?? originalEvent.date,
                selectedDayPredicate:
                    (day) =>
                        selectedDay != null && isSameDay(day, selectedDay!),
                onDaySelected: (day, _) {
                  setState(() => selectedDay = day);
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedDay != null) {
                    Navigator.pop(context);
                    onPaste(selectedDay!);
                  }
                },
                child: Text('Paste'),
              ),
            ],
          );
        },
      );
    },
  );
}
