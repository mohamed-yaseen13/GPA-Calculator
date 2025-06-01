import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_cubit.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_state.dart';

class PasswordDot extends StatelessWidget {
  const PasswordDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: BlocBuilder<PasswordCubit, PasswordState>(
            builder: (context, state) {
              return Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                  color:
                      index < state.input.length ? Colors.black : Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
