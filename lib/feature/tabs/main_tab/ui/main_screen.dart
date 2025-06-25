import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/app_search_bar.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/main_student_data.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semesters_table.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    InterstitialAdManager.loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(4),
          AppSearchBar(),
          verticalSpace(12),
          MainStudentData(),
          verticalSpace(12),
          Expanded(child: SemestersTable()),
        ],
      ),
    );
  }
}
