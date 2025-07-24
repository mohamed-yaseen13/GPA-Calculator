import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/add_course_button.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_row_data.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_row_header.dart';

class CoursesTable extends StatelessWidget {
  const CoursesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CourseRowHeader(),
                      verticalSpace(8),
                      ...state.courses.asMap().entries.map((entry) {
                        final index = entry.key;
                        final course = entry.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: CourseRowData(
                            index: index,
                            course: course,
                            semesterIndex: state.selectedIndex,
                          ),
                        );
                      }),
                      verticalSpace(76),
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AddCourseButton()],
              ),
              verticalSpace(24),
            ],
          );
        },
      ),
    );
  }
}
