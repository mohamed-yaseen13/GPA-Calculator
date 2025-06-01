import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/password_hint_dialogs.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';

class PasswordHint extends StatelessWidget {
  const PasswordHint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final hint = await PasswordHintDialogs.showHintDialog(
              context: context,
              currentHint: state.passwordHint,
            );
            if (hint != null) {
              await context.read<SettingsCubit>().setPasswordHint(hint);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 18.h, left: 12.w, bottom: 18.h),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password Hint',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      state.passwordHint ?? 'Set Hint',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
