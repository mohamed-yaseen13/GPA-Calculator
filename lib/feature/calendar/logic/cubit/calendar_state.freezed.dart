// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarState {

 List<EventModel> get events; DateTime get focusedDay; DateTime? get selectedDay; DateTime? get rangeStart; DateTime? get rangeEnd; bool get rangeSelectionMode;
/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarStateCopyWith<CalendarState> get copyWith => _$CalendarStateCopyWithImpl<CalendarState>(this as CalendarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarState&&const DeepCollectionEquality().equals(other.events, events)&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd)&&(identical(other.rangeSelectionMode, rangeSelectionMode) || other.rangeSelectionMode == rangeSelectionMode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events),focusedDay,selectedDay,rangeStart,rangeEnd,rangeSelectionMode);

@override
String toString() {
  return 'CalendarState(events: $events, focusedDay: $focusedDay, selectedDay: $selectedDay, rangeStart: $rangeStart, rangeEnd: $rangeEnd, rangeSelectionMode: $rangeSelectionMode)';
}


}

/// @nodoc
abstract mixin class $CalendarStateCopyWith<$Res>  {
  factory $CalendarStateCopyWith(CalendarState value, $Res Function(CalendarState) _then) = _$CalendarStateCopyWithImpl;
@useResult
$Res call({
 List<EventModel> events, DateTime focusedDay, DateTime? selectedDay, DateTime? rangeStart, DateTime? rangeEnd, bool rangeSelectionMode
});




}
/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._self, this._then);

  final CalendarState _self;
  final $Res Function(CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = null,Object? focusedDay = null,Object? selectedDay = freezed,Object? rangeStart = freezed,Object? rangeEnd = freezed,Object? rangeSelectionMode = null,}) {
  return _then(_self.copyWith(
events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<EventModel>,focusedDay: null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime?,rangeStart: freezed == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as DateTime?,rangeEnd: freezed == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,rangeSelectionMode: null == rangeSelectionMode ? _self.rangeSelectionMode : rangeSelectionMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalendarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalendarState value)  $default,){
final _that = this;
switch (_that) {
case _CalendarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalendarState value)?  $default,){
final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EventModel> events,  DateTime focusedDay,  DateTime? selectedDay,  DateTime? rangeStart,  DateTime? rangeEnd,  bool rangeSelectionMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.events,_that.focusedDay,_that.selectedDay,_that.rangeStart,_that.rangeEnd,_that.rangeSelectionMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EventModel> events,  DateTime focusedDay,  DateTime? selectedDay,  DateTime? rangeStart,  DateTime? rangeEnd,  bool rangeSelectionMode)  $default,) {final _that = this;
switch (_that) {
case _CalendarState():
return $default(_that.events,_that.focusedDay,_that.selectedDay,_that.rangeStart,_that.rangeEnd,_that.rangeSelectionMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EventModel> events,  DateTime focusedDay,  DateTime? selectedDay,  DateTime? rangeStart,  DateTime? rangeEnd,  bool rangeSelectionMode)?  $default,) {final _that = this;
switch (_that) {
case _CalendarState() when $default != null:
return $default(_that.events,_that.focusedDay,_that.selectedDay,_that.rangeStart,_that.rangeEnd,_that.rangeSelectionMode);case _:
  return null;

}
}

}

/// @nodoc


class _CalendarState implements CalendarState {
  const _CalendarState({final  List<EventModel> events = const [], required this.focusedDay, this.selectedDay, this.rangeStart, this.rangeEnd, this.rangeSelectionMode = true}): _events = events;
  

 final  List<EventModel> _events;
@override@JsonKey() List<EventModel> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

@override final  DateTime focusedDay;
@override final  DateTime? selectedDay;
@override final  DateTime? rangeStart;
@override final  DateTime? rangeEnd;
@override@JsonKey() final  bool rangeSelectionMode;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalendarStateCopyWith<_CalendarState> get copyWith => __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalendarState&&const DeepCollectionEquality().equals(other._events, _events)&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd)&&(identical(other.rangeSelectionMode, rangeSelectionMode) || other.rangeSelectionMode == rangeSelectionMode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events),focusedDay,selectedDay,rangeStart,rangeEnd,rangeSelectionMode);

@override
String toString() {
  return 'CalendarState(events: $events, focusedDay: $focusedDay, selectedDay: $selectedDay, rangeStart: $rangeStart, rangeEnd: $rangeEnd, rangeSelectionMode: $rangeSelectionMode)';
}


}

/// @nodoc
abstract mixin class _$CalendarStateCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(_CalendarState value, $Res Function(_CalendarState) _then) = __$CalendarStateCopyWithImpl;
@override @useResult
$Res call({
 List<EventModel> events, DateTime focusedDay, DateTime? selectedDay, DateTime? rangeStart, DateTime? rangeEnd, bool rangeSelectionMode
});




}
/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(this._self, this._then);

  final _CalendarState _self;
  final $Res Function(_CalendarState) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = null,Object? focusedDay = null,Object? selectedDay = freezed,Object? rangeStart = freezed,Object? rangeEnd = freezed,Object? rangeSelectionMode = null,}) {
  return _then(_CalendarState(
events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<EventModel>,focusedDay: null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: freezed == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime?,rangeStart: freezed == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as DateTime?,rangeEnd: freezed == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,rangeSelectionMode: null == rangeSelectionMode ? _self.rangeSelectionMode : rangeSelectionMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
