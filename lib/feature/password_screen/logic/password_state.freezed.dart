// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PasswordState {
  String get input;
  bool get wrong;

  /// Create a copy of PasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PasswordStateCopyWith<PasswordState> get copyWith =>
      _$PasswordStateCopyWithImpl<PasswordState>(
          this as PasswordState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PasswordState &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.wrong, wrong) || other.wrong == wrong));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input, wrong);

  @override
  String toString() {
    return 'PasswordState(input: $input, wrong: $wrong)';
  }
}

/// @nodoc
abstract mixin class $PasswordStateCopyWith<$Res> {
  factory $PasswordStateCopyWith(
          PasswordState value, $Res Function(PasswordState) _then) =
      _$PasswordStateCopyWithImpl;
  @useResult
  $Res call({String input, bool wrong});
}

/// @nodoc
class _$PasswordStateCopyWithImpl<$Res>
    implements $PasswordStateCopyWith<$Res> {
  _$PasswordStateCopyWithImpl(this._self, this._then);

  final PasswordState _self;
  final $Res Function(PasswordState) _then;

  /// Create a copy of PasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? wrong = null,
  }) {
    return _then(_self.copyWith(
      input: null == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      wrong: null == wrong
          ? _self.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _PasswordState implements PasswordState {
  const _PasswordState({this.input = '', this.wrong = false});

  @override
  @JsonKey()
  final String input;
  @override
  @JsonKey()
  final bool wrong;

  /// Create a copy of PasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PasswordStateCopyWith<_PasswordState> get copyWith =>
      __$PasswordStateCopyWithImpl<_PasswordState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordState &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.wrong, wrong) || other.wrong == wrong));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input, wrong);

  @override
  String toString() {
    return 'PasswordState(input: $input, wrong: $wrong)';
  }
}

/// @nodoc
abstract mixin class _$PasswordStateCopyWith<$Res>
    implements $PasswordStateCopyWith<$Res> {
  factory _$PasswordStateCopyWith(
          _PasswordState value, $Res Function(_PasswordState) _then) =
      __$PasswordStateCopyWithImpl;
  @override
  @useResult
  $Res call({String input, bool wrong});
}

/// @nodoc
class __$PasswordStateCopyWithImpl<$Res>
    implements _$PasswordStateCopyWith<$Res> {
  __$PasswordStateCopyWithImpl(this._self, this._then);

  final _PasswordState _self;
  final $Res Function(_PasswordState) _then;

  /// Create a copy of PasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? input = null,
    Object? wrong = null,
  }) {
    return _then(_PasswordState(
      input: null == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      wrong: null == wrong
          ? _self.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
