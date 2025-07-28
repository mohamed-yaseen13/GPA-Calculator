import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/widgets/banner_ad_widget.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_state.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/add_section_button.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/course_work.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/section_row_data.dart';
import 'package:gpa_calculator/feature/course/ui/widgets/section_row_header.dart';

class SectionsTable extends StatelessWidget {
  const SectionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: BlocBuilder<CourseScreenCubit, CourseScreenState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SectionRowHeader(),
                      verticalSpace(8),
                      ...state.sections.asMap().entries.map((entry) {
                        final index = entry.key;
                        final section = entry.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: SectionRowData(index: index, section: section),
                        );
                      }),
                      verticalSpace(64),
                    ],
                  ),
                ),
              ),
              const CourseWork(),
              verticalSpace(12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AddSectionButton()],
              ),
              verticalSpace(12),
              const BannerAdWidget(),
              verticalSpace(24),
            ],
          );
        },
      ),
    );
  }
}
