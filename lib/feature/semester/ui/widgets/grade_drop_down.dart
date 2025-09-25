import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';

class GradeDropDown extends StatelessWidget {
  final String selectedGrade;
  final ValueChanged<String?> onChanged;

  const GradeDropDown({
    super.key,
    required this.selectedGrade,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          initialValue: selectedGrade,
          decoration: const InputDecoration(
            labelText: 'Grade',
            border: OutlineInputBorder(),
          ),
          items:
              state.grades
                  .map(
                    (grade) => DropdownMenuItem<String>(
                      value: grade,
                      child: Text(grade),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        );
      },
    );
  }
}
