import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
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
        onPressed: context.read<SemesterScreenCubit>().addCourse,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
