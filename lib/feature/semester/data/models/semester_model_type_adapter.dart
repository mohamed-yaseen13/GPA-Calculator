import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SemesterModelTypeAdapter extends TypeAdapter<SemesterModel> {
  @override
  read(BinaryReader reader) {
    return SemesterModel(
      courses: reader.readList().cast<CourseModel>(),
      gpa: reader.readDouble(),
      name: reader.readString(),
      selected: reader.readBool(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, SemesterModel obj) {
    writer.writeList(obj.courses);
    writer.writeDouble(obj.gpa);
    writer.writeString(obj.name);
    writer.writeBool(obj.selected);
  }
}
