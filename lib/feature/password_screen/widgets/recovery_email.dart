import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/recovery_email_dialogs.dart';

class RecoveryEmail extends StatelessWidget {
  const RecoveryEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            final email = await RecoveryEmailDialogs.showEmailDialog(
              context: context,
              currentEmail: state.recoveryEmail,
            );
            if (email != null) {
              await context.read<SettingsCubit>().setRecoveryEmail(email);
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
                      'Recovery Email',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      state.recoveryEmail ?? 'Set Email',
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
