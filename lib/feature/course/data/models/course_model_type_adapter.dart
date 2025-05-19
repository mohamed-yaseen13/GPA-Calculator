import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CourseModelTypeAdapter extends TypeAdapter<CourseModel> {
  @override
  CourseModel read(BinaryReader reader) {
    return CourseModel(
      credits: reader.readDouble(),
      grade: reader.readString(),
      name: reader.readString(),
      selected: reader.readBool(),
    );
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, CourseModel obj) {
    writer.writeDouble(obj.credits);
    writer.writeString(obj.grade);
    writer.writeString(obj.name);
    writer.writeBool(obj.selected);
  }
}
