import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/widgets/data_container.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/courses_table.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_data_data_column.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_data_text_column.dart';

class SemesterScreenBody extends StatelessWidget {
  const SemesterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(4),
          DataContainer(
            leftColumn: SemesterDataTextColumn(),
            rightColumn: SemesterDataDataColumn(),
          ),
          Expanded(child: CoursesTable()),
        ],
      ),
    );
  }
}
