// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsState {
  int get selectedScaleIndex;
  bool get passwordEnabled;
  String get selectedColor;
  String? get password;
  String? get passwordHint;
  String? get recoveryEmail;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      _$SettingsStateCopyWithImpl<SettingsState>(
          this as SettingsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsState &&
            (identical(other.selectedScaleIndex, selectedScaleIndex) ||
                other.selectedScaleIndex == selectedScaleIndex) &&
            (identical(other.passwordEnabled, passwordEnabled) ||
                other.passwordEnabled == passwordEnabled) &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordHint, passwordHint) ||
                other.passwordHint == passwordHint) &&
            (identical(other.recoveryEmail, recoveryEmail) ||
                other.recoveryEmail == recoveryEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedScaleIndex,
      passwordEnabled, selectedColor, password, passwordHint, recoveryEmail);

  @override
  String toString() {
    return 'SettingsState(selectedScaleIndex: $selectedScaleIndex, passwordEnabled: $passwordEnabled, selectedColor: $selectedColor, password: $password, passwordHint: $passwordHint, recoveryEmail: $recoveryEmail)';
  }
}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) _then) =
      _$SettingsStateCopyWithImpl;
  @useResult
  $Res call(
      {int selectedScaleIndex,
      bool passwordEnabled,
      String selectedColor,
      String? password,
      String? passwordHint,
      String? recoveryEmail});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedScaleIndex = null,
    Object? passwordEnabled = null,
    Object? selectedColor = null,
    Object? password = freezed,
    Object? passwordHint = freezed,
    Object? recoveryEmail = freezed,
  }) {
    return _then(_self.copyWith(
      selectedScaleIndex: null == selectedScaleIndex
          ? _self.selectedScaleIndex
          : selectedScaleIndex // ignore: cast_nullable_to_non_nullable
              as int,
      passwordEnabled: null == passwordEnabled
          ? _self.passwordEnabled
          : passwordEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedColor: null == selectedColor
          ? _self.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHint: freezed == passwordHint
          ? _self.passwordHint
          : passwordHint // ignore: cast_nullable_to_non_nullable
              as String?,
      recoveryEmail: freezed == recoveryEmail
          ? _self.recoveryEmail
          : recoveryEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _SettingsState implements SettingsState {
  const _SettingsState(
      {required this.selectedScaleIndex,
      required this.passwordEnabled,
      required this.selectedColor,
      this.password,
      this.passwordHint,
      this.recoveryEmail});

  @override
  final int selectedScaleIndex;
  @override
  final bool passwordEnabled;
  @override
  final String selectedColor;
  @override
  final String? password;
  @override
  final String? passwordHint;
  @override
  final String? recoveryEmail;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsState &&
            (identical(other.selectedScaleIndex, selectedScaleIndex) ||
                other.selectedScaleIndex == selectedScaleIndex) &&
            (identical(other.passwordEnabled, passwordEnabled) ||
                other.passwordEnabled == passwordEnabled) &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordHint, passwordHint) ||
                other.passwordHint == passwordHint) &&
            (identical(other.recoveryEmail, recoveryEmail) ||
                other.recoveryEmail == recoveryEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedScaleIndex,
      passwordEnabled, selectedColor, password, passwordHint, recoveryEmail);

  @override
  String toString() {
    return 'SettingsState(selectedScaleIndex: $selectedScaleIndex, passwordEnabled: $passwordEnabled, selectedColor: $selectedColor, password: $password, passwordHint: $passwordHint, recoveryEmail: $recoveryEmail)';
  }
}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
          _SettingsState value, $Res Function(_SettingsState) _then) =
      __$SettingsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int selectedScaleIndex,
      bool passwordEnabled,
      String selectedColor,
      String? password,
      String? passwordHint,
      String? recoveryEmail});
}

/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedScaleIndex = null,
    Object? passwordEnabled = null,
    Object? selectedColor = null,
    Object? password = freezed,
    Object? passwordHint = freezed,
    Object? recoveryEmail = freezed,
  }) {
    return _then(_SettingsState(
      selectedScaleIndex: null == selectedScaleIndex
          ? _self.selectedScaleIndex
          : selectedScaleIndex // ignore: cast_nullable_to_non_nullable
              as int,
      passwordEnabled: null == passwordEnabled
          ? _self.passwordEnabled
          : passwordEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedColor: null == selectedColor
          ? _self.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHint: freezed == passwordHint
          ? _self.passwordHint
          : passwordHint // ignore: cast_nullable_to_non_nullable
              as String?,
      recoveryEmail: freezed == recoveryEmail
          ? _self.recoveryEmail
          : recoveryEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
