// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseModelAdapter extends TypeAdapter<CourseModel> {
  @override
  final int typeId = 3;

  @override
  CourseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseModel(
      credits: fields[2] as double,
      grade: fields[1] as String,
      name: fields[0] as String,
      selected: fields[3] as bool,
      isRepeated: fields[4] as bool,
      isChanged: fields[5] as bool,
      newGrade: fields[6] as String,
      sections: (fields[7] as List).cast<SectionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.grade)
      ..writeByte(2)
      ..write(obj.credits)
      ..writeByte(3)
      ..write(obj.selected)
      ..writeByte(4)
      ..write(obj.isRepeated)
      ..writeByte(5)
      ..write(obj.isChanged)
      ..writeByte(6)
      ..write(obj.newGrade)
      ..writeByte(7)
      ..write(obj.sections);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
