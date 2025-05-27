import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

class CourseNameTextEditingController extends StatelessWidget {
  final TextEditingController controller;
  const CourseNameTextEditingController({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [LengthLimitingTextInputFormatter(15)],
      decoration: InputDecoration(
        labelText: 'Course Name',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainOrange),
        ),
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter course name';
        }
        for (var course in context.read<SemesterScreenCubit>().state.courses) {
          if (course.name == value) {
            return 'Course already exists';
          }
        }
        return null;
      },
    );
  }
}
