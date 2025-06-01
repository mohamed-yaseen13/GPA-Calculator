import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_state.freezed.dart';

@freezed
abstract class PasswordState with _$PasswordState {
  const factory PasswordState({
    @Default('') String input,
    @Default(false) bool wrong,
  }) = _PasswordState;
}
