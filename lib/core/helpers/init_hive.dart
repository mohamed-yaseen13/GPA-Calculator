import 'package:hive_flutter/hive_flutter.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/timetable/data/models/time_slot_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SectionModelAdapter());
  Hive.registerAdapter(CourseModelAdapter());
  Hive.registerAdapter(SemesterModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  Hive.registerAdapter(ScenarioModelAdapter());
  Hive.registerAdapter(EventModelAdapter());
  Hive.registerAdapter(TimeSlotModelAdapter());

  final studentBox = await Hive.openBox('studentData');
  if (!studentBox.containsKey('default')) {
    studentBox.put('default', StudentModel(semesters: []));
  }

  await Hive.openBox('scenarios');
  await Hive.openBox('events');
  await Hive.openBox('time');
}
