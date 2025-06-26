import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    required int selectedScaleIndex,
    required bool passwordEnabled,
    required String selectedColor,
    required bool isThereLimitationsAfterFallOnCourse,
    String? password,
    String? passwordHint,
    String? recoveryEmail,
  }) = _SettingsState;
}
