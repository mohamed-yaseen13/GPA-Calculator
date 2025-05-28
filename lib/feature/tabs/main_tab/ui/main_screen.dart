import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/widgets/custom_floating_action_button.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/add_semester_bottom_sheet.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/main_student_data.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/ui/widgets/semesters_table.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [MainStudentData(), verticalSpace(12), SemestersTable()],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton<ApplicationAppBarCubit>(
        bottomSheetBuilder: (context) => AddSemesterBottomSheet(text: 'Add'),
        onResult: (context, result) async {
          context.read<ApplicationAppBarCubit>().addSemester(
            name: result['name'],
          );
          context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
        },
      ),
    );
  }
}
