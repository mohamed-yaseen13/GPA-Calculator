import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/check_internet_connection.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/add_section_bottom_sheet.dart';

class AddSectionButton extends StatelessWidget {
  const AddSectionButton({super.key});

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
          final courseScreenCubit = context.read<CourseScreenCubit>();
          final result = await showModalBottomSheet<Map<String, dynamic>>(
            context: context,
            isScrollControlled: true,
            builder:
                (bottomSheetContext) => BlocProvider.value(
                  value: courseScreenCubit,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                    ),
                    child: const AddSectionBottomSheet(text: 'Add'),
                  ),
                ),
          );
          if (result != null) {
            context.read<CourseScreenCubit>().addSection(
              name: result['name'],
              obtainedMark: result['obtainedMark'],
              fullMark: result['fullMark'],
            );
            context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
            InterstitialAdManager.showInterstitialAd();
          }
        },
        child: const Text(
          'Add Section',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
