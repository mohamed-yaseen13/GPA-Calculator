import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/helpers/init_hive.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/feature/splash/splash_screen.dart';
import 'package:gpa_calculator/gpa_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:upgrader/upgrader.dart';

class AppController extends StatefulWidget {
  const AppController({super.key});

  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPasswordNull = true;
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(milliseconds: 2500)); // fake load

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

    _isPasswordNull = password == null;

    await setupGetIt(selectedScaleIndex, customScales);
    await resetMainCubits();
    await updateCalendarWidgetFromHive();

    await Future.delayed(const Duration(milliseconds: 2500));

    if (mounted) {
      setState(() {
        _showSplash = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          _showSplash
              ? FadeTransition(opacity: _animation, child: const SplashScreen())
              : UpgradeAlert(child: GpaApp(isPasswordNull: _isPasswordNull)),
    );
  }
}
