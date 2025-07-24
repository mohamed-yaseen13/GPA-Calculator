import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/scales/ui/widgets/dot_container.dart';
import 'package:gpa_calculator/feature/tabs/notes_tab/ui/widgets/note.dart';

class ShowNoteContainer extends StatefulWidget {
  final int semesterIndex;

  const ShowNoteContainer({super.key, required this.semesterIndex});

  @override
  State<ShowNoteContainer> createState() => _ShowNoteContainerState();
}

class _ShowNoteContainerState extends State<ShowNoteContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final semester =
        context.watch<ApplicationAppBarCubit>().state.semesters[widget
            .semesterIndex];
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 36.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.sp),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                horizontalSpace(12),
                DotContainer(isExpanded: isExpanded),
                horizontalSpace(12),
                Text(
                  'Show ${semester.name} Note',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),

        if (isExpanded) Note(semesterIndex: widget.semesterIndex),
      ],
    );
  }
}
