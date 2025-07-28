import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/widgets/banner_ad_widget.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/tabs/notes_tab/ui/widgets/show_note_container.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child:
                  BlocBuilder<ApplicationAppBarCubit, ApplicationAppBarState>(
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.h,
                          horizontal: 8.w,
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Notes',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                            verticalSpace(4),
                            ...state.semesters.asMap().entries.map((entry) {
                              final semesterIndex = entry.key;
                              return Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: BlocProvider(
                                  create: (_) => getIt<SemesterScreenCubit>(),
                                  child: ShowNoteContainer(
                                    semesterIndex: semesterIndex,
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      );
                    },
                  ),
            ),
          ),
          verticalSpace(78),
          const BannerAdWidget(),
          verticalSpace(24),
        ],
      ),
    );
  }
}
