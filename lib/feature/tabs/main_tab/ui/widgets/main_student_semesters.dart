import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/main_selection.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_button.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_cgpa.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_gpa.dart';

class MainStudentSemesters extends StatelessWidget {
  const MainStudentSemesters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children:
            context
                .read<ApplicationAppBarCubit>()
                .state
                .semesters
                .asMap()
                .entries
                .map((entry) {
                  final index = entry.key;
                  final semester = entry.value;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Row(
                      children: [
                        MainSelection(index: index, semester: semester),
                        SemesterButton(index: index, semester: semester),
                        SemesterGpa(index: index, semester: semester),
                        SemesterCgpa(index: index, semester: semester),
                      ],
                    ),
                  );
                })
                .toList(),
      ),
    );
  }
}
