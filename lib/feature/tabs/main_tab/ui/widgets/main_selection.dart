import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/semester/data/models/semester_model.dart';

class MainSelection extends StatelessWidget {
  final int index;
  final SemesterModel semester;

  const MainSelection({super.key, required this.index, required this.semester});

  @override
  Widget build(BuildContext context) {
    final selectionMode =
        context.read<ApplicationAppBarCubit>().state.selectionMode;
    return selectionMode
        ? SizedBox(
          height: 24.h,
          width: 16.w,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              semester.selected == true
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            onPressed: () {
              context.read<ApplicationAppBarCubit>().toggleSelect(index);
            },
          ),
        )
        : SizedBox(
          width: 1.w,
          child: Text('${index + 1}', style: TextStyle(fontSize: 16.sp)),
        );
  }
}
