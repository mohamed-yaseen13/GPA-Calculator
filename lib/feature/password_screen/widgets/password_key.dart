import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/password_dialogs.dart';

class PasswordKey extends StatelessWidget {
  const PasswordKey({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return InkWell(
          onTap:
              state.passwordEnabled
                  ? () {
                    PasswordDialogs.showPasswordDialog(
                      context: context,
                      dialogType: DialogType.setNewPassword,
                    );
                  }
                  : null,
          child: Padding(
            padding: EdgeInsets.only(top: 18.h, left: 12.w, bottom: 18.h),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password Key',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      state.password ?? 'Set Password',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
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
