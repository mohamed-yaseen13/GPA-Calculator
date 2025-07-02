import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:gpa_calculator/core/helpers/check_internet_connection.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/add_course_bottom_sheet.dart';

class AddCourseButton extends StatelessWidget {
  const AddCourseButton({super.key});

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
          //final hasInternet =
          //    await CheckInternetConnection.isInternetAvailable();
          //if (!hasInternet) {
          //  showDialog(
          //    context: context,
          //    builder:
          //        (_) => AlertDialog(
          //          title: Text('No Internet'),
          //          content: Text('Please turn on the internet'),
          //          actions: [
          //            TextButton(
          //              onPressed: () => Navigator.pop(context),
          //              child: Text('OK'),
          //            ),
          //          ],
          //        ),
          //  );
          //  return;
          //}
          final semesterScreenCubit = context.read<SemesterScreenCubit>();
          final result = await showModalBottomSheet<Map<String, dynamic>>(
            context: context,
            isScrollControlled: true,
            builder:
                (bottomSheetContext) => BlocProvider.value(
                  value: semesterScreenCubit,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                    ),
                    child: AddCourseBottomSheet(text: 'Add'),
                  ),
                ),
          );
          if (result != null) {
            context.read<SemesterScreenCubit>().addCourse(
              name: result['name'],
              grade: result['grade'],
              credits: result['credits'],
            );
            context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
          }
        },
        child: Text(
          'Add Course',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
