// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SemesterModelAdapter extends TypeAdapter<SemesterModel> {
  @override
  final int typeId = 4;

  @override
  SemesterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SemesterModel(
      courses: (fields[2] as List).cast<CourseModel>(),
      name: fields[0] as String,
      gpa: fields[1] as double,
      selected: fields[3] as bool,
      cgpaOriginal: fields[4] as double,
      cgpaChanged: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SemesterModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gpa)
      ..writeByte(2)
      ..write(obj.courses)
      ..writeByte(3)
      ..write(obj.selected)
      ..writeByte(4)
      ..write(obj.cgpaOriginal)
      ..writeByte(5)
      ..write(obj.cgpaChanged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SemesterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
