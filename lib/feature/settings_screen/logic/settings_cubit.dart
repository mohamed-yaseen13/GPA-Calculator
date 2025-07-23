import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/core/logic/gpa_calculations_cubit.dart';
import 'package:gpa_calculator/feature/application_app_bar/logic/application_app_bar_cubit.dart';
import 'package:gpa_calculator/feature/settings_screen/logic/settings_state.dart';
import 'package:gpa_calculator/feature/tabs/main_tab/data/models/student_model.dart';
import 'package:path_provider/path_provider.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
    : super(
        SettingsState(
          selectedScaleIndex: 0,
          passwordEnabled: false,
          selectedColor: 'Yellow',
          isThereLimitationsAfterFallOnCourse: false,
        ),
      ) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final selectedScaleIndex = await PrefsHelper.getSelectedScaleIndex();
    final passwordEnabled = await PrefsHelper.isPasswordEnabled();
    final selectedColor = await PrefsHelper.getNoteColor() ?? 'Yellow';
    final password = await PrefsHelper.getPassword();
    final passwordHint = await PrefsHelper.getPasswordHint();
    final recoveryEmail = await PrefsHelper.getRecoveryEmail();
    final isThereLimitationsAfterFallOnCourse =
        await PrefsHelper.isThereLimitationsAfterFallOnCourse();

    emit(
      state.copyWith(
        selectedScaleIndex: selectedScaleIndex,
        passwordEnabled: passwordEnabled,
        selectedColor: selectedColor,
        password: password,
        passwordHint: passwordHint,
        recoveryEmail: recoveryEmail,
        isThereLimitationsAfterFallOnCourse:
            isThereLimitationsAfterFallOnCourse,
      ),
    );
  }

  Future<bool> confirmPassword(String input) async {
    final correctPassword = state.password;
    return correctPassword != null && correctPassword == input;
  }

  // Set a new password
  Future<void> setNewPassword(String newPassword) async {
    if (newPassword.isEmpty) return;
    await PrefsHelper.setPassword(newPassword);
    await PrefsHelper.setPasswordEnabled(true);
    emit(state.copyWith(passwordEnabled: true, password: newPassword));
  }

  // Disable password
  Future<void> disablePassword() async {
    await PrefsHelper.setPasswordEnabled(false);
    await PrefsHelper.removePassword();
    emit(state.copyWith(passwordEnabled: false, password: null));
  }

  // Set note color
  Future<void> setNoteColor(String color) async {
    await PrefsHelper.setNoteColor(color);
    emit(state.copyWith(selectedColor: color));
  }

  // Get selected scale index
  Future<void> getSelectedScaleIndex() async {
    int index = await PrefsHelper.getSelectedScaleIndex();
    emit(state.copyWith(selectedScaleIndex: index));
  }

  // Backup student data
  Future<void> backupStudentData(BuildContext context) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final backupFile = File('${directory.path}/studentData_backup.json');

      final jsonString = jsonEncode({
        'default': AppConstants.box.get('default')?.toJson(),
      });

      await backupFile.writeAsString(jsonString);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('✅ Backup successful!')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('❌ Backup failed: $e')));
    }
  }

  // Restore student data
  Future<void> restoreStudentData(BuildContext context) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final backupFile = File('${directory.path}/studentData_backup.json');
      if (!await backupFile.exists()) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('No backup file found!')));
        return;
      }

      final jsonString = await backupFile.readAsString();
      final Map<String, dynamic> data = jsonDecode(jsonString);

      await AppConstants.box.clear();

      if (data.containsKey('default')) {
        final restoredStudent = StudentModel.fromJson(
          data['default'] as Map<String, dynamic>,
        );
        await AppConstants.box.put('default', restoredStudent);
      }

      context.read<ApplicationAppBarCubit>().reloadStudent();
      context.read<GpaCalculationsCubit>().reloadStudent();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Restore successful!')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Restore failed: $e')));
    }
  }

  Future<void> setPasswordHint(String hint) async {
    await PrefsHelper.setPasswordHint(hint);
    emit(state.copyWith(passwordHint: hint));
  }

  Future<void> setRecoveryEmail(String recoveryEmail) async {
    await PrefsHelper.setRecoveryEmail(recoveryEmail);
    emit(state.copyWith(recoveryEmail: recoveryEmail));
  }

  Future<void> enableOrDisableLimitationsAfterFallOnCourse(bool value) async {
    await PrefsHelper.enableOrDisableLimitationAfterFallOnCourse(value);
    emit(state.copyWith(isThereLimitationsAfterFallOnCourse: value));
  }
}
