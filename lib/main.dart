import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:gpa_calculator/feature/scales/data/model/scales.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/gpa_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await initHive();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();
  final password = await PrefsHelper.getPassword();
  final isPasswordNull = password == null ? true : false;
  setupGetIt(selectedScaleIndex, customScales);
  runApp(GpaApp(isPasswordNull: isPasswordNull));
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SectionModelAdapter());
  Hive.registerAdapter(CourseModelAdapter());
  Hive.registerAdapter(SemesterModelAdapter());
  Hive.registerAdapter(StudentModelAdapter());
  Box box = await Hive.openBox('studentData');
  if (!box.containsKey('default')) {
    box.put('default', StudentModel(semesters: []));
  } else {
    await migrateOldData(box);
  }
}

Future<void> migrateOldData(Box box) async {
  final student = AppConstants.student;

  bool updated = false;

  for (int i = 1; i < student.semesters.length; i++) {
    final currentSemester = student.semesters[i];

    for (final course in currentSemester.courses) {
      if (course.isFailedBefore != null) continue;

      bool failedBefore = false;

      for (int j = 0; j < i; j++) {
        for (final oldCourse in student.semesters[j].courses) {
          if (oldCourse.name.trim().toLowerCase() ==
              course.name.trim().toLowerCase()) {
            if (getGradePoint(oldCourse.grade) == 0.0) {
              failedBefore = true;
              break;
            }
          }
        }
        if (failedBefore) break;
      }

      course.isFailedBefore = failedBefore;
      updated = true;
    }
  }
  if (updated) {
    await box.put('default', student);
  }
}

Future<double> getGradePoint(String grade) async {
  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();
  List<List<String>> scale =
      Scales.getAllScales(customScales)[selectedScaleIndex]['scale'];
  for (var row in scale) {
    if (row[0] == grade) return double.tryParse(row[2]) ?? 0.0;
  }
  return 0.0;
}
