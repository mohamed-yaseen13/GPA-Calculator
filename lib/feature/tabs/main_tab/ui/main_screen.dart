import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/widgets/banner_ad_widget.dart';
import 'package:gpa_calculator/core/widgets/custom_floating_action_button.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/add_semester_bottom_sheet.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(12),
            BannerAdWidget(),
            verticalSpace(12),
            AppSearchBar(),
            verticalSpace(12),
            MainStudentData(),
            verticalSpace(12),
            SemestersTable(),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton<ApplicationAppBarCubit>(
        bottomSheetBuilder: (context) => AddSemesterBottomSheet(text: 'Add'),
        onResult: (context, result) async {
          context.read<ApplicationAppBarCubit>().addSemester(
            name: result['name'],
          );
          context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
          InterstitialAdManager.showInterstitialAd();
        },
      ),
    );
  }
}
