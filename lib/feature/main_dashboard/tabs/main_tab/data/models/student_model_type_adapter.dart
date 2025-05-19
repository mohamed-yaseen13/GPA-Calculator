import 'package:gpa_calculator/feature/main_dashboard/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StudentModelTypeAdapter extends TypeAdapter<StudentModel> {
  @override
  StudentModel read(BinaryReader reader) {
    return StudentModel(
      cgpa: reader.readDouble(),
      semesters: reader.readList().cast<SemesterModel>(),
      totalCredits: reader.readInt(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer.writeDouble(obj.cgpa);
    writer.writeList(obj.semesters);
    writer.writeInt(obj.totalCredits);
  }
}
