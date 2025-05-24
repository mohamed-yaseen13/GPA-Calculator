import 'package:freezed_annotation/freezed_annotation.dart';

part 'scales_state.freezed.dart';

@freezed
abstract class ScalesState with _$ScalesState {
  const factory ScalesState({
    int? selectedIndex,
    @Default({}) Map<int, bool> isExpandedMap,
  }) = _ScalesState;
}
