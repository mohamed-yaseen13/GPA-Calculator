import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/widgets/banner_ad_widget.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_state.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/section_course_grade.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/sections_table.dart';

class CourseScreenBody extends StatelessWidget {
  const CourseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: BlocBuilder<CourseScreenCubit, CourseScreenState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(8),
                BannerAdWidget(),
                verticalSpace(16),
                verticalSpace(18),
                SectionCourseGrade(
                  course: state.courses[state.selectedCourseIndex],
                ),
                verticalSpace(24),
                Expanded(child: SectionsTable()),
              ],
            );
          },
        ),
      ),
    );
  }
}
