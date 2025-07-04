import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';
import 'package:gpa_calculator/feature/calendar/logic/cubit/calendar_state.dart';
import 'package:gpa_calculator/feature/calendar/ui/widgets/add_event_dialog.dart';
import 'package:gpa_calculator/feature/calendar/ui/widgets/add_range_event_dialog.dart';
import 'package:gpa_calculator/feature/calendar/ui/widgets/show_events_dialog.dart';
import 'package:gpa_calculator/table_calendar/lib/table_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CalendarCubit extends Cubit<CalendarState> {
  final Box eventBox;

  CalendarCubit(this.eventBox)
    : super(CalendarState(focusedDay: DateTime.now())) {
    loadEvents();
  }

  void loadEvents() {
    emit(state.copyWith(events: List<EventModel>.from(eventBox.values)));
  }

  void selectDay(DateTime selected, DateTime focused) {
    if (isSameDay(state.rangeStart, selected)) {
      emit(
        state.copyWith(
          rangeStart: null,
          rangeEnd: null,
          selectedDay: null,
          focusedDay: focused,
          rangeSelectionMode: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          selectedDay: selected,
          focusedDay: focused,
          rangeStart: selected,
          rangeEnd: null,
          rangeSelectionMode: true,
        ),
      );
    }
  }

  void addEvent(EventModel event) async {
    await eventBox.add(event);
    loadEvents();
  }

  void deleteEvent(EventModel event) async {
    final key = event.key;
    await eventBox.delete(key);
    loadEvents();
  }

  List<EventModel> eventsForDay(DateTime day) {
    return state.events
        .where(
          (e) =>
              e.date.year == day.year &&
              e.date.month == day.month &&
              e.date.day == day.day,
        )
        .toList();
  }

  Future<void> showEventsForDay(BuildContext context, DateTime day) async {
    final events = eventsForDay(day);
    await showDialog(
      context: context,
      builder:
          (context) => ShowEventsDialog(
            date: day,
            events: events,
            onAdd: ([int index = -1]) async {
              Navigator.pop(context);
              await addEventForDay(context, day, index: index);
            },
            onDelete: (event) {
              deleteEvent(event);
            },
            onCopy: (copiedEvent, ctx) {
              copyEventToDate(copiedEvent, copiedEvent.date, ctx);
            },
          ),
    );
  }

  Future<void> addEventForDay(
    BuildContext context,
    DateTime day, {
    int index = -1,
  }) async {
    final box = AppConstants.eventsBox;
    final allEvents = box.values.cast<EventModel>().toList();

    EventModel? existingEvent;

    if (index != -1) {
      final eventsForSelectedDay =
          allEvents.where((e) => isSameDay(e.date, day)).toList();
      existingEvent = eventsForSelectedDay[index];
    }

    final result = await showDialog<EventModel>(
      context: context,
      builder:
          (context) => AddEventDialog(date: day, existingEvent: existingEvent),
    );

    if (result != null) {
      if (index != -1 && existingEvent != null) {
        final key = box.keyAt(allEvents.indexOf(existingEvent));
        await box.put(key, result);
        loadEvents();
      } else {
        addEvent(result);
      }
    }
  }

  void copyEventToDate(
    EventModel event,
    DateTime newDate,
    BuildContext context,
  ) {
    final copiedEvent = event.copyWith(date: newDate);

    addEvent(copiedEvent);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Event copied to ${newDate.toLocal().toString().split(" ")[0]}',
        ),
      ),
    );
  }

  Future<void> addEventForRange(
    BuildContext context,
    DateTime start,
    DateTime end,
  ) async {
    final result = await showDialog<EventModel>(
      context: context,
      builder: (context) => AddRangeEventDialog(start: start, end: end),
    );
    if (result != null) {
      DateTime current = start;
      while (!current.isAfter(end)) {
        final event = EventModel(
          date: current,
          title: result.title,
          description: result.description,
        );
        await eventBox.add(event);
        current = current.add(const Duration(days: 1));
      }
      loadEvents();
    }
  }

  void setRange(DateTime? start, DateTime? end, DateTime focusedDay) {
    emit(
      state.copyWith(
        rangeStart: start,
        rangeEnd: end,
        focusedDay: focusedDay,
        selectedDay: null,
      ),
    );
  }
}
