// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeTableState {

 List<TimeSlotModel> get slots;
/// Create a copy of TimeTableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeTableStateCopyWith<TimeTableState> get copyWith => _$TimeTableStateCopyWithImpl<TimeTableState>(this as TimeTableState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeTableState&&const DeepCollectionEquality().equals(other.slots, slots));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'TimeTableState(slots: $slots)';
}


}

/// @nodoc
abstract mixin class $TimeTableStateCopyWith<$Res>  {
  factory $TimeTableStateCopyWith(TimeTableState value, $Res Function(TimeTableState) _then) = _$TimeTableStateCopyWithImpl;
@useResult
$Res call({
 List<TimeSlotModel> slots
});




}
/// @nodoc
class _$TimeTableStateCopyWithImpl<$Res>
    implements $TimeTableStateCopyWith<$Res> {
  _$TimeTableStateCopyWithImpl(this._self, this._then);

  final TimeTableState _self;
  final $Res Function(TimeTableState) _then;

/// Create a copy of TimeTableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slots = null,}) {
  return _then(_self.copyWith(
slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<TimeSlotModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeTableState].
extension TimeTableStatePatterns on TimeTableState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeTableState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeTableState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeTableState value)  $default,){
final _that = this;
switch (_that) {
case _TimeTableState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeTableState value)?  $default,){
final _that = this;
switch (_that) {
case _TimeTableState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TimeSlotModel> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeTableState() when $default != null:
return $default(_that.slots);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TimeSlotModel> slots)  $default,) {final _that = this;
switch (_that) {
case _TimeTableState():
return $default(_that.slots);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TimeSlotModel> slots)?  $default,) {final _that = this;
switch (_that) {
case _TimeTableState() when $default != null:
return $default(_that.slots);case _:
  return null;

}
}

}

/// @nodoc


class _TimeTableState implements TimeTableState {
  const _TimeTableState({required final  List<TimeSlotModel> slots}): _slots = slots;
  

 final  List<TimeSlotModel> _slots;
@override List<TimeSlotModel> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of TimeTableState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeTableStateCopyWith<_TimeTableState> get copyWith => __$TimeTableStateCopyWithImpl<_TimeTableState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeTableState&&const DeepCollectionEquality().equals(other._slots, _slots));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'TimeTableState(slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$TimeTableStateCopyWith<$Res> implements $TimeTableStateCopyWith<$Res> {
  factory _$TimeTableStateCopyWith(_TimeTableState value, $Res Function(_TimeTableState) _then) = __$TimeTableStateCopyWithImpl;
@override @useResult
$Res call({
 List<TimeSlotModel> slots
});




}
/// @nodoc
class __$TimeTableStateCopyWithImpl<$Res>
    implements _$TimeTableStateCopyWith<$Res> {
  __$TimeTableStateCopyWithImpl(this._self, this._then);

  final _TimeTableState _self;
  final $Res Function(_TimeTableState) _then;

/// Create a copy of TimeTableState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slots = null,}) {
  return _then(_TimeTableState(
slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<TimeSlotModel>,
  ));
}


}

// dart format on
