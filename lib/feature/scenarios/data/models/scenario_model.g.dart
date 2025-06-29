// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScenarioModelAdapter extends TypeAdapter<ScenarioModel> {
  @override
  final int typeId = 4;

  @override
  ScenarioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScenarioModel(
      name: fields[0] as String,
      selected: fields[1] as bool,
      student: fields[2] as StudentModel?,
    );
  }

  @override
  void write(BinaryWriter writer, ScenarioModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.selected)
      ..writeByte(2)
      ..write(obj.student);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScenarioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
