import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/helpers/init_hive.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/gpa_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  final stopwatch = Stopwatch()..start();
  await initHive();
  logExecutionTime('Hive.initFlutter()', stopwatch);

  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  await initializeDateFormatting();
  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();
  final password = await PrefsHelper.getPassword();
  final isPasswordNull = password == null;
  await setupGetIt(selectedScaleIndex, customScales);
  await resetMainCubits();

  stopwatch.reset();
  await updateCalendarWidgetFromHive();
  logExecutionTime('updateCalendarWidgetFromHive()', stopwatch);

  stopwatch.reset();
  runApp(GpaApp(isPasswordNull: isPasswordNull));
  logExecutionTime('runApp(MyApp())', stopwatch);
}
