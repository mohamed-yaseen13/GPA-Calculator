import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/theming/app_colors.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

class SemesterScreenBodyCourseRow extends StatelessWidget {
  List<TextEditingController> nameControllers;
  List<TextEditingController> creditControllers;
  SemesterScreenBodyCourseRow({
    super.key,
    required this.nameControllers,
    required this.creditControllers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          context.read<SemesterScreenCubit>().state.courses.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final course = entry.value;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalSpace(16),
                    context.read<SemesterScreenCubit>().state.selectionMode
                        ? IconButton(
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
                        )
                        : Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                    horizontalSpace(16),
                    Expanded(
                      child: TextFormField(
                        controller: nameControllers[index],
                        textAlign: TextAlign.center,
                        inputFormatters: [LengthLimitingTextInputFormatter(20)],
                        decoration: InputDecoration(
                          hintText: 'Course Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainOrange),
                          ),
                        ),
                        onChanged: (value) {
                          context
                              .read<SemesterScreenCubit>()
                              .state
                              .courses[index]
                              .name = value;
                        },
                      ),
                    ),
                    horizontalSpace(32),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value:
                            context
                                .read<SemesterScreenCubit>()
                                .state
                                .courses[index]
                                .grade,
                        items:
                            context.read<SemesterScreenCubit>().grades.map((
                              grade,
                            ) {
                              return DropdownMenuItem<String>(
                                value: grade,
                                child: Text(grade),
                              );
                            }).toList(),
                        onChanged: (value) {
                          context.read<SemesterScreenCubit>().changeCourseGrade(
                            value,
                            index,
                          );
                        },
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: TextFormField(
                        controller: creditControllers[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*'),
                          ),
                        ],
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainOrange),
                          ),
                        ),
                        onChanged: (value) {
                          double val = double.tryParse(value) ?? 0;
                          if (val > 10) {
                            val = 10;
                            creditControllers[index].text = '10';
                            creditControllers[index]
                                .selection = TextSelection.fromPosition(
                              TextPosition(
                                offset: creditControllers[index].text.length,
                              ),
                            );
                          }
                          context
                              .read<SemesterScreenCubit>()
                              .state
                              .courses[index]
                              .credits = val;
                        },
                      ),
                    ),
                    horizontalSpace(16),
                  ],
                ),
              );
            },
          ).toList(),
    );
  }
}
