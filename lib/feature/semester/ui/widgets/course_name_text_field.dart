import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';

class CourseNameTextField extends StatelessWidget {
  final int index;
  final TextEditingController controller;
  const CourseNameTextField({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          inputFormatters: [LengthLimitingTextInputFormatter(20)],
          decoration: const InputDecoration(
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
            for (var course in state.courses) {
              if (course.name == value &&
                  state.courses.indexOf(course) != index) {
                return 'Course already exists';
              }
            }
            return null;
          },
        );
      },
    );
  }
}
