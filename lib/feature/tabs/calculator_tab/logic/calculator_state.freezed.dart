// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculatorState {
  String get displayValue;
  String get previousValue;
  String get operation;
  bool get isNewOperation;
  bool get hasDecimal;
  bool get isError;
  List<String> get history;
  String get expression;
  String get currentInput;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      _$CalculatorStateCopyWithImpl<CalculatorState>(
          this as CalculatorState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalculatorState &&
            (identical(other.displayValue, displayValue) ||
                other.displayValue == displayValue) &&
            (identical(other.previousValue, previousValue) ||
                other.previousValue == previousValue) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.isNewOperation, isNewOperation) ||
                other.isNewOperation == isNewOperation) &&
            (identical(other.hasDecimal, hasDecimal) ||
                other.hasDecimal == hasDecimal) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality().equals(other.history, history) &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.currentInput, currentInput) ||
                other.currentInput == currentInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      displayValue,
      previousValue,
      operation,
      isNewOperation,
      hasDecimal,
      isError,
      const DeepCollectionEquality().hash(history),
      expression,
      currentInput);

  @override
  String toString() {
    return 'CalculatorState(displayValue: $displayValue, previousValue: $previousValue, operation: $operation, isNewOperation: $isNewOperation, hasDecimal: $hasDecimal, isError: $isError, history: $history, expression: $expression, currentInput: $currentInput)';
  }
}

/// @nodoc
abstract mixin class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) _then) =
      _$CalculatorStateCopyWithImpl;
  @useResult
  $Res call(
      {String displayValue,
      String previousValue,
      String operation,
      bool isNewOperation,
      bool hasDecimal,
      bool isError,
      List<String> history,
      String expression,
      String currentInput});
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._self, this._then);

  final CalculatorState _self;
  final $Res Function(CalculatorState) _then;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayValue = null,
    Object? previousValue = null,
    Object? operation = null,
    Object? isNewOperation = null,
    Object? hasDecimal = null,
    Object? isError = null,
    Object? history = null,
    Object? expression = null,
    Object? currentInput = null,
  }) {
    return _then(_self.copyWith(
      displayValue: null == displayValue
          ? _self.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String,
      previousValue: null == previousValue
          ? _self.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      isNewOperation: null == isNewOperation
          ? _self.isNewOperation
          : isNewOperation // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDecimal: null == hasDecimal
          ? _self.hasDecimal
          : hasDecimal // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _self.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      currentInput: null == currentInput
          ? _self.currentInput
          : currentInput // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _CalculatorState implements CalculatorState {
  const _CalculatorState(
      {this.displayValue = '0',
      this.previousValue = '',
      this.operation = '',
      this.isNewOperation = true,
      this.hasDecimal = false,
      this.isError = false,
      final List<String> history = const [],
      this.expression = '',
      this.currentInput = ''})
      : _history = history;

  @override
  @JsonKey()
  final String displayValue;
  @override
  @JsonKey()
  final String previousValue;
  @override
  @JsonKey()
  final String operation;
  @override
  @JsonKey()
  final bool isNewOperation;
  @override
  @JsonKey()
  final bool hasDecimal;
  @override
  @JsonKey()
  final bool isError;
  final List<String> _history;
  @override
  @JsonKey()
  List<String> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  @JsonKey()
  final String expression;
  @override
  @JsonKey()
  final String currentInput;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalculatorStateCopyWith<_CalculatorState> get copyWith =>
      __$CalculatorStateCopyWithImpl<_CalculatorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculatorState &&
            (identical(other.displayValue, displayValue) ||
                other.displayValue == displayValue) &&
            (identical(other.previousValue, previousValue) ||
                other.previousValue == previousValue) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.isNewOperation, isNewOperation) ||
                other.isNewOperation == isNewOperation) &&
            (identical(other.hasDecimal, hasDecimal) ||
                other.hasDecimal == hasDecimal) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.currentInput, currentInput) ||
                other.currentInput == currentInput));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      displayValue,
      previousValue,
      operation,
      isNewOperation,
      hasDecimal,
      isError,
      const DeepCollectionEquality().hash(_history),
      expression,
      currentInput);

  @override
  String toString() {
    return 'CalculatorState(displayValue: $displayValue, previousValue: $previousValue, operation: $operation, isNewOperation: $isNewOperation, hasDecimal: $hasDecimal, isError: $isError, history: $history, expression: $expression, currentInput: $currentInput)';
  }
}

/// @nodoc
abstract mixin class _$CalculatorStateCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$CalculatorStateCopyWith(
          _CalculatorState value, $Res Function(_CalculatorState) _then) =
      __$CalculatorStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String displayValue,
      String previousValue,
      String operation,
      bool isNewOperation,
      bool hasDecimal,
      bool isError,
      List<String> history,
      String expression,
      String currentInput});
}

/// @nodoc
class __$CalculatorStateCopyWithImpl<$Res>
    implements _$CalculatorStateCopyWith<$Res> {
  __$CalculatorStateCopyWithImpl(this._self, this._then);

  final _CalculatorState _self;
  final $Res Function(_CalculatorState) _then;

  /// Create a copy of CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? displayValue = null,
    Object? previousValue = null,
    Object? operation = null,
    Object? isNewOperation = null,
    Object? hasDecimal = null,
    Object? isError = null,
    Object? history = null,
    Object? expression = null,
    Object? currentInput = null,
  }) {
    return _then(_CalculatorState(
      displayValue: null == displayValue
          ? _self.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String,
      previousValue: null == previousValue
          ? _self.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      isNewOperation: null == isNewOperation
          ? _self.isNewOperation
          : isNewOperation // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDecimal: null == hasDecimal
          ? _self.hasDecimal
          : hasDecimal // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _self.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      currentInput: null == currentInput
          ? _self.currentInput
          : currentInput // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
