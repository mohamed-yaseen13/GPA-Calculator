import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class SemesterCgpa extends StatelessWidget {
  final int index;
  final SemesterModel semester;

  const SemesterCgpa({super.key, required this.index, required this.semester});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GpaCalculationsCubit, GpaCalculationsState>(
      builder: (context, state) {
        if (semester.courses.isEmpty) {
          return Text(
            "NEW",
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            textAlign: TextAlign.center,
          );
        }
        final double changed = state.semesters[index].cgpaChanged;
        final double original = state.semesters[index].cgpaOriginal;
        if (changed == original) {
          return Text(
            changed.toStringAsFixed(2),
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
            textAlign: TextAlign.center,
          );
        }
        final Color changedColor =
            changed > original ? Colors.green : Colors.red;
        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: '${original.toStringAsFixed(2)} ',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              TextSpan(
                text: changed.toStringAsFixed(2),
                style: TextStyle(fontSize: 16.sp, color: changedColor),
              ),
            ],
          ),
        );
      },
    );
  }
}
