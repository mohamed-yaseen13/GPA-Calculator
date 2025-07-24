import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/table_calendar/lib/table_calendar.dart';

class AppCalendarTheme {
  static CalendarStyle calendarStyle(BuildContext context) {
    final theme = Theme.of(context);
    return CalendarStyle(
      todayDecoration: const BoxDecoration(),
      todayTextStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
      selectedDecoration: BoxDecoration(
        color: theme.colorScheme.primary,
        shape: BoxShape.circle,
      ),
      weekendTextStyle: const TextStyle(color: Colors.black),
      defaultTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      rangeHighlightColor: Colors.blue.withAlpha((0.3 * 255).toInt()),
      withinRangeTextStyle: const TextStyle(color: Colors.black),
      rangeStartDecoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      rangeEndDecoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }

  static HeaderStyle headerStyle(BuildContext context) {
    final theme = Theme.of(context);
    return HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: TextStyle(
        color: theme.colorScheme.primary,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      leftChevronIcon: Icon(
        Icons.chevron_left,
        color: theme.colorScheme.primary,
      ),
      rightChevronIcon: Icon(
        Icons.chevron_right,
        color: theme.colorScheme.primary,
      ),
    );
  }
}
