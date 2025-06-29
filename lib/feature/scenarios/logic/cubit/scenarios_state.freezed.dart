// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scenarios_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScenariosState {
  List<ScenarioModel> get scenarios;
  bool get selectionMode;
  int get selectedScenarios;

  /// Create a copy of ScenariosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScenariosStateCopyWith<ScenariosState> get copyWith =>
      _$ScenariosStateCopyWithImpl<ScenariosState>(
          this as ScenariosState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScenariosState &&
            const DeepCollectionEquality().equals(other.scenarios, scenarios) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode) &&
            (identical(other.selectedScenarios, selectedScenarios) ||
                other.selectedScenarios == selectedScenarios));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scenarios),
      selectionMode,
      selectedScenarios);

  @override
  String toString() {
    return 'ScenariosState(scenarios: $scenarios, selectionMode: $selectionMode, selectedScenarios: $selectedScenarios)';
  }
}

/// @nodoc
abstract mixin class $ScenariosStateCopyWith<$Res> {
  factory $ScenariosStateCopyWith(
          ScenariosState value, $Res Function(ScenariosState) _then) =
      _$ScenariosStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ScenarioModel> scenarios,
      bool selectionMode,
      int selectedScenarios});
}

/// @nodoc
class _$ScenariosStateCopyWithImpl<$Res>
    implements $ScenariosStateCopyWith<$Res> {
  _$ScenariosStateCopyWithImpl(this._self, this._then);

  final ScenariosState _self;
  final $Res Function(ScenariosState) _then;

  /// Create a copy of ScenariosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scenarios = null,
    Object? selectionMode = null,
    Object? selectedScenarios = null,
  }) {
    return _then(_self.copyWith(
      scenarios: null == scenarios
          ? _self.scenarios
          : scenarios // ignore: cast_nullable_to_non_nullable
              as List<ScenarioModel>,
      selectionMode: null == selectionMode
          ? _self.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedScenarios: null == selectedScenarios
          ? _self.selectedScenarios
          : selectedScenarios // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ScenariosState implements ScenariosState {
  const _ScenariosState(
      {required final List<ScenarioModel> scenarios,
      required this.selectionMode,
      required this.selectedScenarios})
      : _scenarios = scenarios;

  final List<ScenarioModel> _scenarios;
  @override
  List<ScenarioModel> get scenarios {
    if (_scenarios is EqualUnmodifiableListView) return _scenarios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scenarios);
  }

  @override
  final bool selectionMode;
  @override
  final int selectedScenarios;

  /// Create a copy of ScenariosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScenariosStateCopyWith<_ScenariosState> get copyWith =>
      __$ScenariosStateCopyWithImpl<_ScenariosState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScenariosState &&
            const DeepCollectionEquality()
                .equals(other._scenarios, _scenarios) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode) &&
            (identical(other.selectedScenarios, selectedScenarios) ||
                other.selectedScenarios == selectedScenarios));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_scenarios),
      selectionMode,
      selectedScenarios);

  @override
  String toString() {
    return 'ScenariosState(scenarios: $scenarios, selectionMode: $selectionMode, selectedScenarios: $selectedScenarios)';
  }
}

/// @nodoc
abstract mixin class _$ScenariosStateCopyWith<$Res>
    implements $ScenariosStateCopyWith<$Res> {
  factory _$ScenariosStateCopyWith(
          _ScenariosState value, $Res Function(_ScenariosState) _then) =
      __$ScenariosStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<ScenarioModel> scenarios,
      bool selectionMode,
      int selectedScenarios});
}

/// @nodoc
class __$ScenariosStateCopyWithImpl<$Res>
    implements _$ScenariosStateCopyWith<$Res> {
  __$ScenariosStateCopyWithImpl(this._self, this._then);

  final _ScenariosState _self;
  final $Res Function(_ScenariosState) _then;

  /// Create a copy of ScenariosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? scenarios = null,
    Object? selectionMode = null,
    Object? selectedScenarios = null,
  }) {
    return _then(_ScenariosState(
      scenarios: null == scenarios
          ? _self._scenarios
          : scenarios // ignore: cast_nullable_to_non_nullable
              as List<ScenarioModel>,
      selectionMode: null == selectionMode
          ? _self.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedScenarios: null == selectedScenarios
          ? _self.selectedScenarios
          : selectedScenarios // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
