import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/timetable/data/models/time_slot_model.dart';
import 'package:gpa_calculator/feature/timetable/logic/cubit/time_table_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TimeTableCubit extends Cubit<TimeTableState> {
  final Box box;
  TimeTableCubit({required this.box}) : super(TimeTableState(slots: [])) {
    loadDataFromHive();
  }

  void loadDataFromHive() {
    final savedSlots = List<TimeSlotModel>.from(box.values);

    emit(state.copyWith(slots: savedSlots));
  }

  void addSlot(TimeSlotModel slot) {
    final key = '${slot.day}-${slot.interval}-${slot.type}-${slot.content}';

    final updatedSlots = [...state.slots, slot];

    box.put(key, slot);

    emit(state.copyWith(slots: updatedSlots));
  }

  void updateSlot(TimeSlotModel oldSlot, TimeSlotModel updatedSlot) {
    final oldKey =
        '${oldSlot.day}-${oldSlot.interval}-${oldSlot.type}-${oldSlot.content}';
    final newKey =
        '${updatedSlot.day}-${updatedSlot.interval}-${updatedSlot.type}-${updatedSlot.content}';

    box.delete(oldKey);
    box.put(newKey, updatedSlot);

    final updatedSlots = [...state.slots];

    final index = updatedSlots.indexWhere(
      (s) => '${s.day}-${s.interval}-${s.type}-${s.content}' == oldKey,
    );

    if (index != -1) {
      updatedSlots[index] = updatedSlot;
    }

    emit(state.copyWith(slots: updatedSlots));
  }

  void deleteSlot(TimeSlotModel slot) {
    final key = '${slot.day}-${slot.interval}-${slot.type}-${slot.content}';

    box.delete(key);

    final updatedSlots =
        state.slots
            .where(
              (s) => '${s.day}-${s.interval}-${s.type}-${s.content}' != key,
            )
            .toList();

    emit(state.copyWith(slots: updatedSlots));
  }
}
