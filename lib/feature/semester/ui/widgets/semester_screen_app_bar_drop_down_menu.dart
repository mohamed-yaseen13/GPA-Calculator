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
        child: DropdownButton<String>(
          value:
              context.read<SemesterScreenCubit>().state.selectedTerm!.isEmpty
                  ? null
                  : context.read<SemesterScreenCubit>().state.selectedTerm,
          hint: Text('Term Name', style: TextStyle(color: Colors.white60)),
          dropdownColor: Color(0xFF303030),
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          items:
              context.read<SemesterScreenCubit>().state.semesters.map((
                semester,
              ) {
                return DropdownMenuItem<String>(
                  value: semester.name,
                  child: Text(
                    semester.name,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
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
