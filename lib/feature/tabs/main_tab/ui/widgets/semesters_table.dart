import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/add_semester_button.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/main_import_button.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_row_data.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semester_row_header.dart';

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SemesterRowHeader(),
                      verticalSpace(8),
                      ...state.semesters.asMap().entries.map((entry) {
                        final index = entry.key;
                        final semester = entry.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: SemesterRowData(
                            index: index,
                            semester: semester,
                          ),
                        );
                      }),
                      verticalSpace(78),
                    ],
                  ),
                ),
              ),
              if (!AppConstants.isScenarioMode)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AddSemesterButton()],
                ),

              if (AppConstants.isScenarioMode)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const AddSemesterButton(),
                    MainImportButton(
                      scenarioIndex: AppConstants.selectedScenarioIndex,
                    ),
                  ],
                ),
              verticalSpace(24),
            ],
          );
        },
      ),
    );
  }
}
