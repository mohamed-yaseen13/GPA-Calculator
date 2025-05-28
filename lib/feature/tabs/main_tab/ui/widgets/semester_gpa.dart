import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class SemesterGpa extends StatelessWidget {
  final int index;
  final SemesterModel semester;

  const SemesterGpa({super.key, required this.index, required this.semester});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GpaCalculationsCubit, GpaCalculationsState>(
      builder: (context, state) {
        final text =
            semester.courses.isNotEmpty
                ? state.semesters[index].gpa.toStringAsFixed(2)
                : 'NEW';
        final color = semester.courses.isNotEmpty ? Colors.black : Colors.grey;
        return Text(
          text,
          style: TextStyle(fontSize: 16.sp, color: color),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
