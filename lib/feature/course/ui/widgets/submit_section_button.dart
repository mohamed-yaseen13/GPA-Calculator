import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_state.dart';

class SubmitSectionButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController obtainedMarkController;
  final TextEditingController fullMarkController;
  final String text;

  const SubmitSectionButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.fullMarkController,
    required this.obtainedMarkController,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseScreenCubit, CourseScreenState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (!formKey.currentState!.validate()) {
              return;
            }
            context.pop({
              'name': nameController.text,
              'obtainedMark': double.parse(obtainedMarkController.text),
              'fullMark': double.parse(fullMarkController.text),
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainOrange,
            foregroundColor: Colors.white,
          ),
          child: Text('$text Section'),
        );
      },
    );
  }
}
