import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_state.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';

class MainStudentSemesters extends StatelessWidget {
  const MainStudentSemesters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children:
            context
                .read<ApplicationAppBarCubit>()
                .state
                .semesters
                .asMap()
                .entries
                .map((entry) {
                  final index = entry.key;
                  final semester = entry.value;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Row(
                      children: [
                        context
                                .read<ApplicationAppBarCubit>()
                                .state
                                .selectionMode
                            ? SizedBox(
                              height: 24.h,
                              width: 16.w,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  semester.selected == true
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  context
                                      .read<ApplicationAppBarCubit>()
                                      .toggleSelect(index);
                                },
                              ),
                            )
                            : SizedBox(
                              width: 1.w,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18.w,
                                  vertical: 8.h,
                                ),
                                minimumSize: Size(0, 0),
                              ),
                              onPressed: () {
                                context.pushNamed(
                                  AppRoutes.semesterScreen,
                                  arguments: {'semesterIndex': index},
                                );
                              },
                              child: Text(
                                semester.name,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                        BlocBuilder<GpaCalculationsCubit, GpaCalculationsState>(
                          builder: (context, state) {
                            return Expanded(
                              flex: 2,
                              child: Text(
                                semester.courses.isNotEmpty
                                    ? state.semesters[index].gpa
                                        .toStringAsFixed(2)
                                    : 'NEW',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color:
                                      semester.courses.isNotEmpty
                                          ? Colors.black
                                          : Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                        BlocBuilder<GpaCalculationsCubit, GpaCalculationsState>(
                          builder: (context, state) {
                            return Expanded(
                              flex: 2,
                              child: Text(
                                semester.courses.isNotEmpty
                                    ? state.semesters[index].cgpaChanged
                                        .toStringAsFixed(2)
                                    : "NEW",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color:
                                      semester.courses.isNotEmpty
                                          ? Colors.black
                                          : Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                })
                .toList(),
      ),
    );
  }
}
