import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_state.dart';

class SectionNameTextField extends StatelessWidget {
  final TextEditingController controller;

  const SectionNameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseScreenCubit, CourseScreenState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(20),
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
          ],
          decoration: const InputDecoration(
            labelText: 'Section Name',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainOrange),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter course name';
            }
            return null;
          },
        );
      },
    );
  }
}
