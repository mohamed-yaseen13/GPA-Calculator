import 'package:gpa_calculator/table_calendar/lib/table_calendar.dart';
import 'package:home_widget/home_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';

Future<void> saveIfChanged(String key, String value) async {
  final current = await HomeWidget.getWidgetData<String>(key, defaultValue: '');
  if (current != value) {
    await HomeWidget.saveWidgetData(key, value);
  }
}

Future<void> updateCalendarWidgetFromHive() async {
  final box = Hive.box('events');
  final now = DateTime.now();
  final currentMonth = DateTime(now.year, now.month);

  final String monthName = DateFormat('MMMM yyyy').format(currentMonth);
  await saveIfChanged('month_title', monthName);

  final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);

  const int saturdayIndex = DateTime.saturday;
  final int firstWeekday = firstDayOfMonth.weekday;
  final int offset = (firstWeekday - saturdayIndex + 7) % 7;

  final startDate = firstDayOfMonth.subtract(Duration(days: offset));

  for (int i = 0; i < 35; i++) {
    final dayDate = startDate.add(Duration(days: i));
    final keyBase = 'day_${i + 1}';

    await saveIfChanged('${keyBase}_number', dayDate.day.toString());
    await saveIfChanged(
      '${keyBase}_isDim',
      (dayDate.month == currentMonth.month) ? 'false' : 'true',
    );

    final events =
        box.values
            .cast<EventModel>()
            .where((e) => isSameDay(e.date, dayDate))
            .toList();

    if (events.isNotEmpty) {
      final firstTitle = events.first.title;
      final secondLine = events.length > 1 ? '+${events.length - 1}' : '';

      await saveIfChanged('${keyBase}_event_line1', firstTitle);
      await saveIfChanged('${keyBase}_event_line2', secondLine);
    } else {
      await saveIfChanged('${keyBase}_event_line1', '');
      await saveIfChanged('${keyBase}_event_line2', '');
    }
  }

  await HomeWidget.updateWidget(name: 'CalendarWidgetProvider');
}
