import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/dependency_injection/di.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_cubit.dart';
import 'package:gpa_calculator/feature/semester/logic/semester_screen_state.dart';

class NoteBodyContainer extends StatelessWidget {
  const NoteBodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<SemesterScreenCubit>()),
        BlocProvider.value(value: getIt<ApplicationAppBarCubit>()),
      ],
      child: BlocListener<SemesterScreenCubit, SemesterScreenState>(
        listenWhen:
            (previous, current) => previous.bodyColor != current.bodyColor,
        listener: (context, state) {},
        child: BlocBuilder<SemesterScreenCubit, SemesterScreenState>(
          builder: (context, state) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                width: 320.w,
                height: 194.h,
                decoration: BoxDecoration(color: state.bodyColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  child: Text(
                    context
                        .read<ApplicationAppBarCubit>()
                        .state
                        .semesters[state.selectedIndex]
                        .note,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
