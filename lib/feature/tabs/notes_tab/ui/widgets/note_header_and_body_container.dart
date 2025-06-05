import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/functions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';

class NoteHeaderAndBodyContainer extends StatefulWidget {
  final int semesterIndex;
  final TextEditingController controller;

  const NoteHeaderAndBodyContainer({
    super.key,
    required this.semesterIndex,
    required this.controller,
  });

  @override
  State<NoteHeaderAndBodyContainer> createState() =>
      _NoteHeaderAndBodyContainerState();
}

class _NoteHeaderAndBodyContainerState
    extends State<NoteHeaderAndBodyContainer> {
  bool isEditMode = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: 320.w,
              height: 24.h,
              decoration: BoxDecoration(color: state.headerColor),
              child:
                  !isEditMode
                      ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isEditMode = true;
                          });
                        },
                        child: Row(
                          children: [
                            Spacer(),
                            Text('EDIT'),
                            horizontalSpace(4),
                            Icon(Icons.edit, color: Colors.grey),
                          ],
                        ),
                      )
                      : Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isEditMode = false;
                              });
                            },
                            child: Row(
                              children: [
                                Text('CANCEL'),
                                horizontalSpace(4),
                                Icon(Icons.cancel, color: Colors.grey),
                              ],
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isEditMode = false;
                              });
                              final noteText = widget.controller.text;
                              context
                                  .read<ApplicationAppBarCubit>()
                                  .saveSemesterNote(
                                    widget.semesterIndex,
                                    noteText,
                                  );
                              printStudentData();
                            },
                            child: Row(
                              children: [
                                Text('SAVE'),
                                horizontalSpace(4),
                                Icon(Icons.save, color: Colors.grey),
                              ],
                            ),
                          ),
                        ],
                      ),
            ),
            Container(
              width: 320.w,
              height: 194.h,
              decoration: BoxDecoration(color: state.bodyColor),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: TextField(
                  controller: widget.controller,
                  readOnly: !isEditMode,
                  enabled: isEditMode,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: isEditMode ? 'Enter notes here...' : '',
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
