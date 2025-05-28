import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/course/data/models/course_model.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/add_course_bottom_sheet.dart';

class EditCourseIcon extends StatelessWidget {
  final int index;
  final CourseModel course;

  const EditCourseIcon({super.key, required this.index, required this.course});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [PopupMenuItem(value: 1, child: Text('Edit'))],
      menuPadding: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      onSelected: (value) async {
        final result = await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder:
              (bottomSheetContext) => BlocProvider.value(
                value: context.read<SemesterScreenCubit>(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
                  ),
                  child: AddCourseBottomSheet(
                    index: index,
                    text: 'Edit',
                    initialName: course.name,
                    initialCredits: course.credits,
                    initialGrade: course.grade,
                  ),
                ),
              ),
        );
        if (result != null) {
          context.read<SemesterScreenCubit>().addCourse(
            name: result['name'],
            credits: result['credits'],
            grade: result['grade'],
            index: index,
          );
        }
      },
    );
  }
}
