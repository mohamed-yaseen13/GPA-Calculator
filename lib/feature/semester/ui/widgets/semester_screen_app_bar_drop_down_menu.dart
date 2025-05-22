import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';

class SemesterScreenAppBarDropDownMenu extends StatelessWidget {
  const SemesterScreenAppBarDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: DropdownButton<int>(
          value:
              context
                      .read<SemesterScreenCubit>()
                      .state
                      .semesters[context
                          .read<SemesterScreenCubit>()
                          .state
                          .selectedIndex]
                      .name
                      .isEmpty
                  ? null
                  : context.read<SemesterScreenCubit>().state.selectedIndex,
          hint: Text('Term Name', style: TextStyle(color: Colors.white60)),
          dropdownColor: Color(0xFF303030),
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          items:
              List.generate(
                context.read<SemesterScreenCubit>().state.semesters.length,
                (index) {
                  final semester =
                      context
                          .read<SemesterScreenCubit>()
                          .state
                          .semesters[index];
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(
                      semester.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ).toList(),
          onChanged: context.read<SemesterScreenCubit>().changeTerm,
          menuWidth: context.read<SemesterScreenCubit>().state.dropdownWidth,
          icon: Padding(
            padding: EdgeInsets.only(left: 64.w),
            child: Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
