import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/course/data/models/section_model.dart';
import 'package:gpa_calculator/feature/scenarios/data/models/scenario_model.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';
import 'package:gpa_calculator/gpa_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await initHive();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  await initializeDateFormatting();
  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();
  final password = await PrefsHelper.getPassword();
  final isPasswordNull = password == null ? true : false;
  setupGetIt(selectedScaleIndex, customScales);
  resetMainCubits();
  await updateCalendarWidgetFromHive();
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
  }

  Hive.registerAdapter(ScenarioModelAdapter());
  await Hive.openBox('scenarios');

  Hive.registerAdapter(EventModelAdapter());
  await Hive.openBox('events');
}
