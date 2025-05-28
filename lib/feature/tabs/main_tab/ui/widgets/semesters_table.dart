import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/edit_icon.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/main_selection.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_button.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_cgpa.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_gpa.dart';

class SemestersTable extends StatelessWidget {
  const SemestersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: BlocBuilder<ApplicationAppBarCubit, ApplicationAppBarState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('#', style: TextStyle(fontSize: 16.sp)),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Semesters',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'GPA',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'CGPA',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              ),
              verticalSpace(8),
              ...state.semesters.asMap().entries.map((entry) {
                final index = entry.key;
                final semester = entry.value;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: MainSelection(index: index, semester: semester),
                      ),
                      Expanded(
                        flex: 7,
                        child: SemesterButton(index: index, semester: semester),
                      ),
                      Expanded(
                        flex: 6,
                        child: SemesterGpa(index: index, semester: semester),
                      ),
                      Expanded(
                        flex: 6,
                        child: SemesterCgpa(index: index, semester: semester),
                      ),
                      Expanded(
                        flex: 1,
                        child: EditIcon(index: index, semester: semester),
                      ),
                    ],
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
