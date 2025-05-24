// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scales_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScalesState {

 int? get selectedIndex; Map<int, bool> get isExpandedMap;
/// Create a copy of ScalesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScalesStateCopyWith<ScalesState> get copyWith => _$ScalesStateCopyWithImpl<ScalesState>(this as ScalesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScalesState&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&const DeepCollectionEquality().equals(other.isExpandedMap, isExpandedMap));
}


@override
int get hashCode => Object.hash(runtimeType,selectedIndex,const DeepCollectionEquality().hash(isExpandedMap));

@override
String toString() {
  return 'ScalesState(selectedIndex: $selectedIndex, isExpandedMap: $isExpandedMap)';
}


}

/// @nodoc
abstract mixin class $ScalesStateCopyWith<$Res>  {
  factory $ScalesStateCopyWith(ScalesState value, $Res Function(ScalesState) _then) = _$ScalesStateCopyWithImpl;
@useResult
$Res call({
 int? selectedIndex, Map<int, bool> isExpandedMap
});




}
/// @nodoc
class _$ScalesStateCopyWithImpl<$Res>
    implements $ScalesStateCopyWith<$Res> {
  _$ScalesStateCopyWithImpl(this._self, this._then);

  final ScalesState _self;
  final $Res Function(ScalesState) _then;

/// Create a copy of ScalesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedIndex = freezed,Object? isExpandedMap = null,}) {
  return _then(_self.copyWith(
selectedIndex: freezed == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,isExpandedMap: null == isExpandedMap ? _self.isExpandedMap : isExpandedMap // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,
  ));
}

}


/// @nodoc


class _ScalesState implements ScalesState {
  const _ScalesState({this.selectedIndex, final  Map<int, bool> isExpandedMap = const {}}): _isExpandedMap = isExpandedMap;
  

@override final  int? selectedIndex;
 final  Map<int, bool> _isExpandedMap;
@override@JsonKey() Map<int, bool> get isExpandedMap {
  if (_isExpandedMap is EqualUnmodifiableMapView) return _isExpandedMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_isExpandedMap);
}


/// Create a copy of ScalesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScalesStateCopyWith<_ScalesState> get copyWith => __$ScalesStateCopyWithImpl<_ScalesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScalesState&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&const DeepCollectionEquality().equals(other._isExpandedMap, _isExpandedMap));
}


@override
int get hashCode => Object.hash(runtimeType,selectedIndex,const DeepCollectionEquality().hash(_isExpandedMap));

@override
String toString() {
  return 'ScalesState(selectedIndex: $selectedIndex, isExpandedMap: $isExpandedMap)';
}


}

/// @nodoc
abstract mixin class _$ScalesStateCopyWith<$Res> implements $ScalesStateCopyWith<$Res> {
  factory _$ScalesStateCopyWith(_ScalesState value, $Res Function(_ScalesState) _then) = __$ScalesStateCopyWithImpl;
@override @useResult
$Res call({
 int? selectedIndex, Map<int, bool> isExpandedMap
});




}
/// @nodoc
class __$ScalesStateCopyWithImpl<$Res>
    implements _$ScalesStateCopyWith<$Res> {
  __$ScalesStateCopyWithImpl(this._self, this._then);

  final _ScalesState _self;
  final $Res Function(_ScalesState) _then;

/// Create a copy of ScalesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedIndex = freezed,Object? isExpandedMap = null,}) {
  return _then(_ScalesState(
selectedIndex: freezed == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,isExpandedMap: null == isExpandedMap ? _self._isExpandedMap : isExpandedMap // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,
  ));
}


}

// dart format on
