import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/widgets/banner_ad_widget.dart';
import 'package:gpa_calculator/core/widgets/custom_floating_action_button.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/add_course_bottom_sheet.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/courses_table.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_data.dart';

class SemesterScreenBody extends StatelessWidget {
  const SemesterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(8),
            BannerAdWidget(),
            verticalSpace(8),
            SemesterData(),
            CoursesTable(),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton<SemesterScreenCubit>(
        bottomSheetBuilder: (context) => AddCourseBottomSheet(text: 'Add'),
        onResult: (context, result) async {
          context.read<SemesterScreenCubit>().addCourse(
            name: result['name'],
            grade: result['grade'],
            credits: result['credits'],
          );
          context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
        },
      ),
    );
  }
}
