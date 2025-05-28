import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';

class SemesterNameTextField extends StatelessWidget {
  final TextEditingController controller;

  const SemesterNameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationAppBarCubit, ApplicationAppBarState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          inputFormatters: [LengthLimitingTextInputFormatter(15)],
          decoration: InputDecoration(
            labelText: 'Semester Name',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainOrange),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter Semester name';
            }
            for (var semester in state.semesters) {
              if (semester.name == value) {
                return 'Semester already exists';
              }
            }
            return null;
          },
        );
      },
    );
  }
}
