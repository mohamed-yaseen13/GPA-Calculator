import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

class SemesterScreenBodyCourseRow extends StatelessWidget {
  const SemesterScreenBodyCourseRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          context.read<SemesterScreenCubit>().state.courses.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final course = entry.value;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    context.read<SemesterScreenCubit>().state.selectionMode
                        ? SizedBox(
                          height: 24.h,
                          width: 16.w,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: Icon(
                              course.selected == true
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              context.read<SemesterScreenCubit>().toggleSelect(
                                index,
                              );
                            },
                          ),
                        )
                        : SizedBox(
                          width: 4.w,
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
                          onPressed: () {},
                          child: Text(
                            course.name,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        course.grade,
                        style: TextStyle(fontSize: 16.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        course.credits.toString(),
                        style: TextStyle(fontSize: 16.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
    );
  }
}
