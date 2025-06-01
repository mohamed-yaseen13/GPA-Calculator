import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/password_dialogs.dart';

class PasswordRow extends StatelessWidget {
  const PasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return InkWell(
          onTap:
              state.passwordEnabled
                  ? () async {
                    final confirmed =
                        await PasswordDialogs.showConfirmPasswordDialog(
                          context,
                        );
                    if (confirmed == true) {
                      context.pushNamed(AppRoutes.passwordScreen);
                    }
                  }
                  : null,
          child: Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 18.h),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/password_lock.svg'),
                horizontalSpace(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      state.passwordEnabled ? 'Enabled - Edit' : 'Disabled',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
                const Spacer(),
                Switch(
                  value: state.passwordEnabled,
                  onChanged: (val) async {
                    if (!val) {
                      final confirmed =
                          await PasswordDialogs.showConfirmPasswordDialog(
                            context,
                          );
                      if (confirmed == true) {
                        await context.read<SettingsCubit>().disablePassword();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Password turned Off')),
                        );
                      }
                    } else {
                      await context.read<SettingsCubit>().setNewPassword('');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password turned On')),
                      );
                      await PasswordDialogs.showPasswordDialog(
                        context: context,
                        isNewPassword: true,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
