import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/backup_and_restore_column.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/calculations_column.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/others_column.dart';
import 'package:gpa_calculator/feature/settings_screen/ui/widgets/preferences_column.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CalculationsColumn(),
              verticalSpace(18),
              PreferencesColumn(),
              verticalSpace(18),
              BackupAndRestoreColumn(),
              verticalSpace(18),
              OthersColumn(),
            ],
          ),
        ),
      ),
    );
  }
}
