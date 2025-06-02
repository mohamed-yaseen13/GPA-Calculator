import 'package:freezed_annotation/freezed_annotation.dart';

part 'converter_state.freezed.dart';

@freezed
abstract class ConverterState with _$ConverterState {
  const factory ConverterState({
    @Default('') String obtainedMark,
    @Default('') String totalMark,
    @Default('') String convertedResult,
    @Default('') String convertToTotal,
  }) = _ConverterState;
}
