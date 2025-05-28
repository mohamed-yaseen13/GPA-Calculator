import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';

class SemesterScreenAppBarDropDownMenu extends StatelessWidget {
  const SemesterScreenAppBarDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: DropdownButton<int>(
              value:
                  state.semesters[state.selectedIndex].name.isEmpty
                      ? null
                      : state.selectedIndex,
              hint: Text('Term Name', style: TextStyle(color: Colors.white60)),
              dropdownColor: Color(0xFF303030),
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
              items:
                  List.generate(state.semesters.length, (index) {
                    final semester = state.semesters[index];
                    return DropdownMenuItem<int>(
                      value: index,
                      child: Text(
                        semester.name.isEmpty ? "Term Name" : semester.name,
                        style: TextStyle(
                          color:
                              semester.name.isEmpty
                                  ? Colors.white60
                                  : Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: context.read<SemesterScreenCubit>().changeTerm,
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
