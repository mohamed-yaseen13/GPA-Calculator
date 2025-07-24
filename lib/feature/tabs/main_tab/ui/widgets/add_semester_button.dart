import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/check_internet_connection.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/add_semester_bottom_sheet.dart';

class AddSemesterButton extends StatelessWidget {
  const AddSemesterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black),
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
                    title: const Text('No Internet'),
                    content: const Text('Please turn on the internet'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
            );
            return;
          }
          final appBarCubit = context.read<ApplicationAppBarCubit>();
          final result = await showModalBottomSheet<Map<String, dynamic>>(
            context: context,
            isScrollControlled: true,
            builder:
                (bottomSheetContext) => BlocProvider.value(
                  value: appBarCubit,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                    ),
                    child: const AddSemesterBottomSheet(text: 'Add'),
                  ),
                ),
          );
          if (result != null) {
            appBarCubit.addSemester(name: result['name']);
            context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
            InterstitialAdManager.showInterstitialAd();
          }
        },
        child: const Text(
          'Add Semester',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
