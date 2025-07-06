// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeSlotModelAdapter extends TypeAdapter<TimeSlotModel> {
  @override
  final int typeId = 6;

  @override
  TimeSlotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeSlotModel(
      content: fields[3] as String,
      day: fields[0] as String,
      interval: fields[1] as String,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TimeSlotModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.interval)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSlotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
