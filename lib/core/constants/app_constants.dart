import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  static final Box<StudentModel> box = Hive.box<StudentModel>('studentData');

  static StudentModel? get student => box.get('default');

  static Future<int> getSelectedScaleIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(PrefsHelper.selectedScaleKey) ?? 1;
  }

  static Future<List<String>> get grades async {
    final index = await getSelectedScaleIndex();
    final customScales = await PrefsHelper.loadCustomScales();
    final scale =
        Scales.getAllScales(customScales)[index]['scale'] as List<List<String>>;
    return ['--', ...scale.map((row) => row[0])];
  }
}
