import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/add_course_bottom_sheet.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_body_course_row.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_body_header_row.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_screen_body_logo_and_gpa.dart';

class SemesterScreenBody extends StatelessWidget {
  List<TextEditingController> nameControllers;
  List<TextEditingController> creditControllers;

  SemesterScreenBody({
    super.key,
    required this.nameControllers,
    required this.creditControllers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SemesterScreenBodyLogoAndGpa(),
            SemesterScreenBodyHeaderRow(),
            SemesterScreenBodyCourseRow(
              nameControllers: nameControllers,
              creditControllers: creditControllers,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder:
                (bottomSheetContext) => BlocProvider.value(
                  value: context.read<SemesterScreenCubit>(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                    ),
                    child: AddCourseBottomSheet(),
                  ),
                ),
          );

          if (result != null) {
            context.read<SemesterScreenCubit>().addCourse(
              name: result['name'],
              credits: result['credits'],
              grade: result['grade'],
            );
            context.read<GpaCalculationsCubit>().calculateGpaAndCgpa();
          }
        },
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
