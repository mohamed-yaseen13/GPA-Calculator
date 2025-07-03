import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/header_row.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/scenario_import_button.dart';
import 'package:gpa_calculator/feature/scenarios/ui/widgets/semester_row.dart';

class AllSemestersTable extends StatelessWidget {
  const AllSemestersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: BlocProvider(
        create:
            (context) => ApplicationAppBarCubit(
              box: AppConstants.box,
              student: AppConstants.student,
            )..cancelSelection(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child:
                    BlocBuilder<ApplicationAppBarCubit, ApplicationAppBarState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            HeaderRow(),
                            verticalSpace(16),
                            ...state.semesters.asMap().entries.map((entry) {
                              final index = entry.key;
                              final semester = entry.value;
                              return Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  vertical: 16.h,
                                ),
                                child: SemesterRow(
                                  semester: semester,
                                  index: index,
                                ),
                              );
                            }),
                            verticalSpace(76),
                          ],
                        );
                      },
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScenarioImportButton(index: AppConstants.selectedScenarioIndex),
              ],
            ),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
