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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    MobileAds.instance.initialize(),
    ScreenUtil.ensureScreenSize(),
    dotenv.load(fileName: ".env"),
    initializeDateFormatting(),
  ]);

  await initHive();

  final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
  final customScales = await PrefsHelper.loadCustomScales();
  final password = await PrefsHelper.getPassword();

  await setupGetIt(selectedScaleIndex, customScales);
  await resetMainCubits();

  await updateCalendarWidgetFromHive();

  runApp(GpaApp(isPasswordNull: password == null));
}
