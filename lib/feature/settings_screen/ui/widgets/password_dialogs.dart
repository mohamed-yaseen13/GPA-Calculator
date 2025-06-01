import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';

class PasswordDialogs {
  static Future<void> showPasswordDialog({
    required BuildContext context,
    String? currentPassword,
    bool isNewPassword = false,
  }) async {
    String tempPassword = '';
    bool wrong = false;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text(
                isNewPassword ? 'Set New Password' : 'Enter Password',
              ),
              content: TextField(
                autofocus: true,
                obscureText: true,
                onChanged: (val) {
                  tempPassword = val;
                  setStateDialog(() {
                    wrong = false;
                  });
                },
                decoration: InputDecoration(
                  hintText: isNewPassword ? 'New Password' : 'Password',
                  errorText:
                      wrong
                          ? (isNewPassword
                              ? 'Password cannot be empty'
                              : 'Incorrect password')
                          : null,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    if (tempPassword.isEmpty) {
                      setStateDialog(() {
                        wrong = true;
                      });
                      return;
                    }

                    if (isNewPassword) {
                      // Set a new password
                      await context.read<SettingsCubit>().setNewPassword(
                        tempPassword,
                      );
                    } else {
                      // Confirm the current password
                      final confirmed = await context
                          .read<SettingsCubit>()
                          .confirmPassword(tempPassword);
                      if (!confirmed) {
                        setStateDialog(() {
                          wrong = true;
                        });
                        return;
                      }
                    }

                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  static Future<bool?> showConfirmPasswordDialog(BuildContext context) async {
    String input = '';
    bool wrong = false;

    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Enter Password'),
              content: TextField(
                autofocus: true,
                obscureText: true,
                onChanged: (val) {
                  input = val;
                  setStateDialog(() {
                    wrong = false;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  errorText: wrong ? 'Incorrect password' : null,
                ),
                onSubmitted: (_) async {
                  final confirmed = await context
                      .read<SettingsCubit>()
                      .confirmPassword(input);
                  if (confirmed) {
                    Navigator.pop(context, true);
                  } else {
                    setStateDialog(() {
                      wrong = true;
                    });
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
                    final confirmed = await context
                        .read<SettingsCubit>()
                        .confirmPassword(input);
                    if (confirmed) {
                      Navigator.pop(context, true);
                    } else {
                      setStateDialog(() {
                        wrong = true;
                      });
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
