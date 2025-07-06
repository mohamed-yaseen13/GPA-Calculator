import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpa_calculator/feature/timetable/data/models/time_slot_model.dart';

part 'time_table_state.freezed.dart';

@freezed
abstract class TimeTableState with _$TimeTableState {
  const factory TimeTableState({required List<TimeSlotModel> slots}) =
      _TimeTableState;
}
