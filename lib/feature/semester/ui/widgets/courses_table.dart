import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_button.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/course_grade.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/edit_course_icon.dart';
import 'package:gpa_calculator/feature/semester/ui/widgets/semester_selection.dart';

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
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('#', style: TextStyle(fontSize: 16.sp)),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      'Courses',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Grades',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Credits',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              ),
              verticalSpace(8),
              ...state.courses.asMap().entries.map((entry) {
                final index = entry.key;
                final course = entry.value;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SemesterSelection(index: index, course: course),
                      ),
                      Expanded(
                        flex: 7,
                        child: CourseButton(
                          courseIndex: index,
                          course: course,
                          semesterIndex: state.selectedIndex,
                        ),
                      ),
                      Expanded(flex: 6, child: CourseGrade(course: course)),
                      Expanded(
                        flex: 6,
                        child: Text(
                          course.credits.toString(),
                          style: TextStyle(fontSize: 16.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: EditCourseIcon(index: index, course: course),
                      ),
                    ],
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
