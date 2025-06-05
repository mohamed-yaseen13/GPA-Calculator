import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/tabs/notes_tab/ui/widgets/note_header_and_body_container.dart';

class Note extends StatelessWidget {
  final int semesterIndex;

  const Note({super.key, required this.semesterIndex});

  @override
  Widget build(BuildContext context) {
    final semester =
        context.watch<ApplicationAppBarCubit>().state.semesters[semesterIndex];
    TextEditingController noteController = TextEditingController(
      text: semester.note,
    );
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Column(
        children: [
          NoteHeaderAndBodyContainer(
            semesterIndex: semesterIndex,
            controller: noteController,
          ),
        ],
      ),
    );
  }
}
