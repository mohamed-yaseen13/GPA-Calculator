import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_state.dart';

class SearchResultContainer extends StatelessWidget {
  const SearchResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      color: Color(0xFFFFF6E7),
      elevation: 4,
      borderRadius: BorderRadius.circular(8.r),
      child: BlocBuilder<ApplicationAppBarCubit, ApplicationAppBarState>(
        builder: (context, state) {
          return SizedBox(
            height:
                state.searchResults.isEmpty
                    ? 0.0
                    : state.searchResults.length >= 4
                    ? 300.h
                    : state.searchResults.length * 75.h,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: state.searchResults.length,
              separatorBuilder: (_, __) => Divider(height: 1.h),
              itemBuilder:
                  (_, i) => ListTile(
                    onTap: () {
                      resetSemesterScreenCubit();
                      context.pushNamed(
                        AppRoutes.semesterScreen,
                        arguments: {
                          'semesterIndex':
                              state.searchResults[i]['semesterIndex'],
                        },
                      );
                    },
                    title: Text(state.searchResults[i]['course'] ?? ''),
                    subtitle: Text(state.searchResults[i]['semester'] ?? ''),
                  ),
            ),
          );
        },
      ),
    );
  }
}
