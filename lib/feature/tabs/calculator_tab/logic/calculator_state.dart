import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_state.freezed.dart';

@freezed
abstract class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    @Default('0') String displayValue,
    @Default('') String previousValue,
    @Default('') String operation,
    @Default(true) bool isNewOperation,
    @Default(false) bool hasDecimal,
    @Default(false) bool isError,
    @Default([]) List<String> history,
    @Default('') String expression,
    @Default('') String currentInput,
  }) = _CalculatorState;
}
