// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_app_bar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationAppBarState {

 bool get selectionMode; int get selectedItem; List<SemesterModel> get semesters;
/// Create a copy of ApplicationAppBarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationAppBarStateCopyWith<ApplicationAppBarState> get copyWith => _$ApplicationAppBarStateCopyWithImpl<ApplicationAppBarState>(this as ApplicationAppBarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationAppBarState&&(identical(other.selectionMode, selectionMode) || other.selectionMode == selectionMode)&&(identical(other.selectedItem, selectedItem) || other.selectedItem == selectedItem)&&const DeepCollectionEquality().equals(other.semesters, semesters));
}


@override
int get hashCode => Object.hash(runtimeType,selectionMode,selectedItem,const DeepCollectionEquality().hash(semesters));

@override
String toString() {
  return 'ApplicationAppBarState(selectionMode: $selectionMode, selectedItem: $selectedItem, semesters: $semesters)';
}


}

/// @nodoc
abstract mixin class $ApplicationAppBarStateCopyWith<$Res>  {
  factory $ApplicationAppBarStateCopyWith(ApplicationAppBarState value, $Res Function(ApplicationAppBarState) _then) = _$ApplicationAppBarStateCopyWithImpl;
@useResult
$Res call({
 bool selectionMode, int selectedItem, List<SemesterModel> semesters
});




}
/// @nodoc
class _$ApplicationAppBarStateCopyWithImpl<$Res>
    implements $ApplicationAppBarStateCopyWith<$Res> {
  _$ApplicationAppBarStateCopyWithImpl(this._self, this._then);

  final ApplicationAppBarState _self;
  final $Res Function(ApplicationAppBarState) _then;

/// Create a copy of ApplicationAppBarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectionMode = null,Object? selectedItem = null,Object? semesters = null,}) {
  return _then(_self.copyWith(
selectionMode: null == selectionMode ? _self.selectionMode : selectionMode // ignore: cast_nullable_to_non_nullable
as bool,selectedItem: null == selectedItem ? _self.selectedItem : selectedItem // ignore: cast_nullable_to_non_nullable
as int,semesters: null == semesters ? _self.semesters : semesters // ignore: cast_nullable_to_non_nullable
as List<SemesterModel>,
  ));
}

}


/// @nodoc


class _ApplicationAppBarState implements ApplicationAppBarState {
  const _ApplicationAppBarState({required this.selectionMode, required this.selectedItem, required final  List<SemesterModel> semesters}): _semesters = semesters;
  

@override final  bool selectionMode;
@override final  int selectedItem;
 final  List<SemesterModel> _semesters;
@override List<SemesterModel> get semesters {
  if (_semesters is EqualUnmodifiableListView) return _semesters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_semesters);
}


/// Create a copy of ApplicationAppBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationAppBarStateCopyWith<_ApplicationAppBarState> get copyWith => __$ApplicationAppBarStateCopyWithImpl<_ApplicationAppBarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationAppBarState&&(identical(other.selectionMode, selectionMode) || other.selectionMode == selectionMode)&&(identical(other.selectedItem, selectedItem) || other.selectedItem == selectedItem)&&const DeepCollectionEquality().equals(other._semesters, _semesters));
}


@override
int get hashCode => Object.hash(runtimeType,selectionMode,selectedItem,const DeepCollectionEquality().hash(_semesters));

@override
String toString() {
  return 'ApplicationAppBarState(selectionMode: $selectionMode, selectedItem: $selectedItem, semesters: $semesters)';
}


}

/// @nodoc
abstract mixin class _$ApplicationAppBarStateCopyWith<$Res> implements $ApplicationAppBarStateCopyWith<$Res> {
  factory _$ApplicationAppBarStateCopyWith(_ApplicationAppBarState value, $Res Function(_ApplicationAppBarState) _then) = __$ApplicationAppBarStateCopyWithImpl;
@override @useResult
$Res call({
 bool selectionMode, int selectedItem, List<SemesterModel> semesters
});




}
/// @nodoc
class __$ApplicationAppBarStateCopyWithImpl<$Res>
    implements _$ApplicationAppBarStateCopyWith<$Res> {
  __$ApplicationAppBarStateCopyWithImpl(this._self, this._then);

  final _ApplicationAppBarState _self;
  final $Res Function(_ApplicationAppBarState) _then;

/// Create a copy of ApplicationAppBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectionMode = null,Object? selectedItem = null,Object? semesters = null,}) {
  return _then(_ApplicationAppBarState(
selectionMode: null == selectionMode ? _self.selectionMode : selectionMode // ignore: cast_nullable_to_non_nullable
as bool,selectedItem: null == selectedItem ? _self.selectedItem : selectedItem // ignore: cast_nullable_to_non_nullable
as int,semesters: null == semesters ? _self._semesters : semesters // ignore: cast_nullable_to_non_nullable
as List<SemesterModel>,
  ));
}


}

// dart format on
