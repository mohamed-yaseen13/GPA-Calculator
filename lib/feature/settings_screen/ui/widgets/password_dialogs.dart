import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';

enum DialogType { setNewPassword, confirmPassword }

class PasswordDialogs {
  static Future<bool?> showPasswordDialog({
    required BuildContext context,
    DialogType dialogType = DialogType.confirmPassword,
    String? currentPassword,
  }) async {
    final settingsCubit = context.read<SettingsCubit>();

    List<int> digits = [0, 0, 0, 0];
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
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: NumberPicker(
                          value: digits[index],
                          minValue: 0,
                          maxValue: 9,
                          zeroPad: true,
                          itemWidth: 40,
                          itemHeight: 60,
                          onChanged: (value) {
                            setStateDialog(() {
                              digits[index] = value;
                              wrong = false;
                            });
                          },
                        ),
                      );
                    }),
                  ),
                  if (wrong)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        dialogType == DialogType.setNewPassword
                            ? 'Password cannot be empty'
                            : 'Incorrect password',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    final password = digits.join();
                    if (password.isEmpty &&
                        dialogType == DialogType.setNewPassword) {
                      setStateDialog(() {
                        wrong = true;
                      });
                      return;
                    }

                    if (dialogType == DialogType.setNewPassword) {
                      await settingsCubit.setNewPassword(password);
                      Navigator.pop(context, true);
                    } else {
                      final confirmed = await settingsCubit.confirmPassword(
                        password,
                      );
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
