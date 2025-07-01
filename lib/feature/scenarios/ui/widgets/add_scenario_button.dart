import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/check_internet_connection.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/feature/scenarios/logic/cubit/scenarios_cubit.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/add_scenario_bottom_shett.dart';

class AddScenarioButton extends StatelessWidget {
  const AddScenarioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
        ),
        onPressed: () async {
          final hasInternet =
              await CheckInternetConnection.isInternetAvailable();
          if (!hasInternet) {
            showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(
                    title: Text('No Internet'),
                    content: Text('Please turn on the internet'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
            );
            return;
          }
          final scenariosCubit = context.read<ScenariosCubit>();
          final result = await showModalBottomSheet<Map<String, dynamic>>(
            context: context,
            isScrollControlled: true,
            builder:
                (bottomSheetContext) => BlocProvider.value(
                  value: scenariosCubit,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                    ),
                    child: AddScenarioBottomShett(text: 'Add'),
                  ),
                ),
          );
          if (result != null) {
            context.read<ScenariosCubit>().addScenario(name: result['name']);
            InterstitialAdManager.showInterstitialAd();
          }
        },
        child: Text(
          'Add Scenario',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
