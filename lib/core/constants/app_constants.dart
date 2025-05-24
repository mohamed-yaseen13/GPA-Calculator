import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppConstants {
  static final Box box = Hive.box('studentData');

  static final StudentModel student = box.get('default');

  static final List<String> grades = [
    '--',
    'A+',
    'A',
    'A-',
    'B+',
    'B',
    'B-',
    'C+',
    'C',
    'C-',
    'D+',
    'D',
    'F',
    'Fr',
  ];
}
