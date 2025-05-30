import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/add_section_bottom_sheet.dart';

class AddSectionButton extends StatelessWidget {
  const AddSectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await showModalBottomSheet<Map<String, dynamic>>(
          context: context,
          isScrollControlled: true,
          builder:
              (bottomSheetContext) => BlocProvider.value(
                value: context.read<CourseScreenCubit>(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                  ),
                  child: AddSectionBottomSheet(text: 'Add'),
                ),
              ),
        );
        if (result != null) {
          context.read<CourseScreenCubit>().addSection(
            name: result['name'],
            obtainedMark: result['obtainedMark'],
            fullMark: result['fullMark'],
          );
        }
      },
      child: Text('Add Section'),
    );
  }
}
