import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';

enum DialogType { setNewPassword, confirmPassword }

class PasswordDialogs {
  static Future<bool?> showPasswordDialog({
    required BuildContext context,
    DialogType dialogType = DialogType.confirmPassword,
    String? currentPassword,
  }) async {
    String tempPassword = '';
    bool wrong = false;

    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text(
                dialogType == DialogType.setNewPassword
                    ? 'Set New Password'
                    : 'Enter Password',
              ),
              content: TextField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                onChanged: (val) {
                  tempPassword = val;
                  setStateDialog(() {
                    wrong = false;
                  });
                },
                decoration: InputDecoration(
                  hintText:
                      dialogType == DialogType.setNewPassword
                          ? 'New Password'
                          : 'Password',
                  errorText:
                      wrong
                          ? (dialogType == DialogType.setNewPassword
                              ? 'Password cannot be empty'
                              : 'Incorrect password')
                          : null,
                ),
                onSubmitted: (_) async {
                  if (dialogType == DialogType.confirmPassword) {
                    final confirmed = await context
                        .read<SettingsCubit>()
                        .confirmPassword(tempPassword);
                    if (confirmed) {
                      Navigator.pop(context, true);
                    } else {
                      setStateDialog(() {
                        wrong = true;
                      });
                    }
                  }
                },
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    if (tempPassword.isEmpty &&
                        dialogType == DialogType.setNewPassword) {
                      setStateDialog(() {
                        wrong = true;
                      });
                      return;
                    }

                    if (dialogType == DialogType.setNewPassword) {
                      await context.read<SettingsCubit>().setNewPassword(
                        tempPassword,
                      );
                      Navigator.pop(context, true);
                    } else {
                      final confirmed = await context
                          .read<SettingsCubit>()
                          .confirmPassword(tempPassword);
                      if (confirmed) {
                        Navigator.pop(context, true);
                      } else {
                        setStateDialog(() {
                          wrong = true;
                        });
                      }
                    }
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
