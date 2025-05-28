import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  static final Box box = Hive.box('studentData');

  static StudentModel get student => box.get('default');

  static Future<int> getSelectedScaleIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('selected_scale_index') ?? 1;
  }

  static Future<List<String>> get grades async {
    final index = await getSelectedScaleIndex();
    final scale = Scales.values[index];
    return ['--', ...scale.map((row) => row[0])];
  }
}
