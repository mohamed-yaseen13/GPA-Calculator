import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/check_internet_connection.dart';
import 'package:gpa_calculator/core/helpers/interstitial_ad_manager.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';

class Note extends StatefulWidget {
  final int semesterIndex;

  const Note({super.key, required this.semesterIndex});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  bool isEditMode = false;
  @override
  Widget build(BuildContext context) {
    final semester =
        context.watch<ApplicationAppBarCubit>().state.semesters[widget
            .semesterIndex];
    TextEditingController noteController = TextEditingController(
      text: semester.note,
    );

    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
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
                          onTap: () async {
                            final hasInternet =
                                await CheckInternetConnection.isInternetAvailable();
                            if (!hasInternet) {
                              showDialog(
                                context: context,
                                builder:
                                    (_) => AlertDialog(
                                      title: const Text('No Internet'),
                                      content: const Text(
                                        'Please turn on the internet',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed:
                                              () => Navigator.pop(context),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                              );
                              return;
                            }
                            setState(() {
                              isEditMode = true;
                            });
                          },
                          child: Row(
                            children: [
                              const Spacer(),
                              const Text('EDIT'),
                              horizontalSpace(4),
                              const Icon(Icons.edit, color: Colors.grey),
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
                                  const Text('CANCEL'),
                                  horizontalSpace(4),
                                  const Icon(Icons.cancel, color: Colors.grey),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEditMode = false;
                                });
                                final noteText = noteController.text;
                                context
                                    .read<ApplicationAppBarCubit>()
                                    .saveSemesterNote(
                                      widget.semesterIndex,
                                      noteText,
                                    );
                                InterstitialAdManager.showInterstitialAd();
                              },
                              child: Row(
                                children: [
                                  const Text('SAVE'),
                                  horizontalSpace(4),
                                  const Icon(Icons.save, color: Colors.grey),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 2.h,
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                    controller: noteController,
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
      ),
    );
  }
}
