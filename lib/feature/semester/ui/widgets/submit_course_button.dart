import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';

class SubmitCourseButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController creditController;
  final String selectedGrade;
  final String text;

  const SubmitCourseButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.creditController,
    required this.selectedGrade,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () async {
            bool canProceed = true;
            for (var i = 0; i < state.selectedIndex; i++) {
              for (var course in state.semesters[i].courses) {
                if (course.name == nameController.text) {
                  final result = await showSubmitDialog(context: context);
                  if (result != null) {
                    canProceed = false;
                  }
                  break;
                }
              }
            }
            if (!formKey.currentState!.validate() || !canProceed) {
              return;
            }
            context.pop({
              'name': nameController.text,
              'credits': double.parse(creditController.text),
              'grade': selectedGrade,
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainOrange,
            foregroundColor: Colors.white,
          ),
          child: Text('$text Course'),
        );
      },
    );
  }
}

Future showSubmitDialog({required BuildContext context}) async {
  final result = await showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          content: Text(
            'This Course already exists are you sure to reassign it',
          ),
          actions: [
            TextButton(onPressed: () => context.pop(false), child: Text('No')),
            TextButton(onPressed: () => context.pop(true), child: Text('Yes')),
          ],
        ),
  );
  if (result == true) {
    return null;
  }
  return 'Course already exists';
}
