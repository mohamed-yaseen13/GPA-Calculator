import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_cubit.dart';
import 'package:gpa_calculator/feature/course/logic/course_screen_state.dart';

class CourseScreenAppBarDropDownMenu extends StatelessWidget {
  const CourseScreenAppBarDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseScreenCubit, CourseScreenState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: DropdownButton<int>(
              value:
                  state.courses[state.selectedCourseIndex].name.isEmpty
                      ? null
                      : state.selectedCourseIndex,
              hint: Text('Term Name', style: TextStyle(color: Colors.white60)),
              dropdownColor: Color(0xFF303030),
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
              items:
                  List.generate(state.courses.length, (index) {
                    final course = state.courses[index];
                    return DropdownMenuItem<int>(
                      value: index,
                      child: Text(
                        course.name.isEmpty ? "Term Name" : course.name,
                        style: TextStyle(
                          color:
                              course.name.isEmpty
                                  ? Colors.white60
                                  : Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: context.read<CourseScreenCubit>().changeCourse,
              menuWidth: state.dropdownWidth,
              icon: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Icon(Icons.arrow_drop_down, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
