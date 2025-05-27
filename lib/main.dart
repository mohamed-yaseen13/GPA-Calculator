import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/gpa_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  runApp(GpaApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CourseModelAdapter());
  Hive.registerAdapter(SemesterModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  Box box = await Hive.openBox('studentData');
  box.put(
    'default',
    StudentModel(
      cgpa: 0,
      semesters: [
        SemesterModel(courses: [], gpa: 0, name: '', selected: false),
      ],
      totalCredits: 0,
    ),
  );
}
