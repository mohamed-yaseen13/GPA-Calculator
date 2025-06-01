import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/password_hint.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/password_key.dart';
import 'package:gpa_calculator/feature/password_screen/widgets/recovery_email.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/password_dialogs.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Password'),
            actions: [
              Switch(
                value: state.passwordEnabled,
                onChanged: (val) async {
                  if (!val) {
                    await context.read<SettingsCubit>().disablePassword();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password turned Off')),
                    );
                  } else {
                    await context.read<SettingsCubit>().setNewPassword('');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password turned On')),
                    );
                    await PasswordDialogs.showPasswordDialog(
                      context: context,
                      dialogType: DialogType.setNewPassword,
                    );
                  }
                },
              ),
            ],
          ),
          body: IgnorePointer(
            ignoring: !state.passwordEnabled,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: const [
                    PasswordKey(),
                    Divider(color: Colors.grey, thickness: 1, height: 0),
                    PasswordHint(),
                    Divider(color: Colors.grey, thickness: 1, height: 0),
                    RecoveryEmail(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
