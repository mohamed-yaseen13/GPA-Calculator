import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_cubit.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_state.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/password_dot.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/password_numbers.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';

class PasswordGate extends StatelessWidget {
  const PasswordGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(24),
                  Text(
                    'Enter Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(48),
                  PasswordDot(),
                  if (state.wrong)
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        'Incorrect password',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  verticalSpace(24),
                  PasswordNumbers(
                    onPasswordCorrect: () {
                      context.pushReplacementNamed(AppRoutes.applicationAppBar);
                    },
                  ),
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      return Text(
                        state.passwordHint.isNullOrEmpty()
                            ? ''
                            : 'Hint: ${state.passwordHint}',
                        style: TextStyle(color: Colors.grey),
                      );
                    },
                  ),
                  verticalSpace(16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                    ),
                    onPressed: () {
                      context.read<PasswordCubit>().sendPasswordToRecoveryEmail(
                        context,
                      );
                    },
                    child: Text(
                      'FORGOT PASSWORD?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  verticalSpace(4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
