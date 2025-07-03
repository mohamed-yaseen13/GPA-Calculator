import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default([]) List<EventModel> events,
    required DateTime focusedDay,
    DateTime? selectedDay,
    DateTime? rangeStart,
    DateTime? rangeEnd,
    @Default(true) bool rangeSelectionMode,
  }) = _CalendarState;
}
