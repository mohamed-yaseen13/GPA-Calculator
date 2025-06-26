// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gpa_calculations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GpaCalculationsState {
  double get cgpa;
  int get totalCredits;
  List<SemesterModel> get semesters;
  bool get isThereLimitationsAfterFallOnCourse;
  String? get limitationAfterFallOnCourse;

  /// Create a copy of GpaCalculationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GpaCalculationsStateCopyWith<GpaCalculationsState> get copyWith =>
      _$GpaCalculationsStateCopyWithImpl<GpaCalculationsState>(
          this as GpaCalculationsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GpaCalculationsState &&
            (identical(other.cgpa, cgpa) || other.cgpa == cgpa) &&
            (identical(other.totalCredits, totalCredits) ||
                other.totalCredits == totalCredits) &&
            const DeepCollectionEquality().equals(other.semesters, semesters) &&
            (identical(other.isThereLimitationsAfterFallOnCourse,
                    isThereLimitationsAfterFallOnCourse) ||
                other.isThereLimitationsAfterFallOnCourse ==
                    isThereLimitationsAfterFallOnCourse) &&
            (identical(other.limitationAfterFallOnCourse,
                    limitationAfterFallOnCourse) ||
                other.limitationAfterFallOnCourse ==
                    limitationAfterFallOnCourse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cgpa,
      totalCredits,
      const DeepCollectionEquality().hash(semesters),
      isThereLimitationsAfterFallOnCourse,
      limitationAfterFallOnCourse);

  @override
  String toString() {
    return 'GpaCalculationsState(cgpa: $cgpa, totalCredits: $totalCredits, semesters: $semesters, isThereLimitationsAfterFallOnCourse: $isThereLimitationsAfterFallOnCourse, limitationAfterFallOnCourse: $limitationAfterFallOnCourse)';
  }
}

/// @nodoc
abstract mixin class $GpaCalculationsStateCopyWith<$Res> {
  factory $GpaCalculationsStateCopyWith(GpaCalculationsState value,
          $Res Function(GpaCalculationsState) _then) =
      _$GpaCalculationsStateCopyWithImpl;
  @useResult
  $Res call(
      {double cgpa,
      int totalCredits,
      List<SemesterModel> semesters,
      bool isThereLimitationsAfterFallOnCourse,
      String? limitationAfterFallOnCourse});
}

/// @nodoc
class _$GpaCalculationsStateCopyWithImpl<$Res>
    implements $GpaCalculationsStateCopyWith<$Res> {
  _$GpaCalculationsStateCopyWithImpl(this._self, this._then);

  final GpaCalculationsState _self;
  final $Res Function(GpaCalculationsState) _then;

  /// Create a copy of GpaCalculationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cgpa = null,
    Object? totalCredits = null,
    Object? semesters = null,
    Object? isThereLimitationsAfterFallOnCourse = null,
    Object? limitationAfterFallOnCourse = freezed,
  }) {
    return _then(_self.copyWith(
      cgpa: null == cgpa
          ? _self.cgpa
          : cgpa // ignore: cast_nullable_to_non_nullable
              as double,
      totalCredits: null == totalCredits
          ? _self.totalCredits
          : totalCredits // ignore: cast_nullable_to_non_nullable
              as int,
      semesters: null == semesters
          ? _self.semesters
          : semesters // ignore: cast_nullable_to_non_nullable
              as List<SemesterModel>,
      isThereLimitationsAfterFallOnCourse: null ==
              isThereLimitationsAfterFallOnCourse
          ? _self.isThereLimitationsAfterFallOnCourse
          : isThereLimitationsAfterFallOnCourse // ignore: cast_nullable_to_non_nullable
              as bool,
      limitationAfterFallOnCourse: freezed == limitationAfterFallOnCourse
          ? _self.limitationAfterFallOnCourse
          : limitationAfterFallOnCourse // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _GpaCalculationsState implements GpaCalculationsState {
  const _GpaCalculationsState(
      {required this.cgpa,
      required this.totalCredits,
      required final List<SemesterModel> semesters,
      required this.isThereLimitationsAfterFallOnCourse,
      required this.limitationAfterFallOnCourse})
      : _semesters = semesters;

  @override
  final double cgpa;
  @override
  final int totalCredits;
  final List<SemesterModel> _semesters;
  @override
  List<SemesterModel> get semesters {
    if (_semesters is EqualUnmodifiableListView) return _semesters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_semesters);
  }

  @override
  final bool isThereLimitationsAfterFallOnCourse;
  @override
  final String? limitationAfterFallOnCourse;

  /// Create a copy of GpaCalculationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GpaCalculationsStateCopyWith<_GpaCalculationsState> get copyWith =>
      __$GpaCalculationsStateCopyWithImpl<_GpaCalculationsState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GpaCalculationsState &&
            (identical(other.cgpa, cgpa) || other.cgpa == cgpa) &&
            (identical(other.totalCredits, totalCredits) ||
                other.totalCredits == totalCredits) &&
            const DeepCollectionEquality()
                .equals(other._semesters, _semesters) &&
            (identical(other.isThereLimitationsAfterFallOnCourse,
                    isThereLimitationsAfterFallOnCourse) ||
                other.isThereLimitationsAfterFallOnCourse ==
                    isThereLimitationsAfterFallOnCourse) &&
            (identical(other.limitationAfterFallOnCourse,
                    limitationAfterFallOnCourse) ||
                other.limitationAfterFallOnCourse ==
                    limitationAfterFallOnCourse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cgpa,
      totalCredits,
      const DeepCollectionEquality().hash(_semesters),
      isThereLimitationsAfterFallOnCourse,
      limitationAfterFallOnCourse);

  @override
  String toString() {
    return 'GpaCalculationsState(cgpa: $cgpa, totalCredits: $totalCredits, semesters: $semesters, isThereLimitationsAfterFallOnCourse: $isThereLimitationsAfterFallOnCourse, limitationAfterFallOnCourse: $limitationAfterFallOnCourse)';
  }
}

/// @nodoc
abstract mixin class _$GpaCalculationsStateCopyWith<$Res>
    implements $GpaCalculationsStateCopyWith<$Res> {
  factory _$GpaCalculationsStateCopyWith(_GpaCalculationsState value,
          $Res Function(_GpaCalculationsState) _then) =
      __$GpaCalculationsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double cgpa,
      int totalCredits,
      List<SemesterModel> semesters,
      bool isThereLimitationsAfterFallOnCourse,
      String? limitationAfterFallOnCourse});
}

/// @nodoc
class __$GpaCalculationsStateCopyWithImpl<$Res>
    implements _$GpaCalculationsStateCopyWith<$Res> {
  __$GpaCalculationsStateCopyWithImpl(this._self, this._then);

  final _GpaCalculationsState _self;
  final $Res Function(_GpaCalculationsState) _then;

  /// Create a copy of GpaCalculationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cgpa = null,
    Object? totalCredits = null,
    Object? semesters = null,
    Object? isThereLimitationsAfterFallOnCourse = null,
    Object? limitationAfterFallOnCourse = freezed,
  }) {
    return _then(_GpaCalculationsState(
      cgpa: null == cgpa
          ? _self.cgpa
          : cgpa // ignore: cast_nullable_to_non_nullable
              as double,
      totalCredits: null == totalCredits
          ? _self.totalCredits
          : totalCredits // ignore: cast_nullable_to_non_nullable
              as int,
      semesters: null == semesters
          ? _self._semesters
          : semesters // ignore: cast_nullable_to_non_nullable
              as List<SemesterModel>,
      isThereLimitationsAfterFallOnCourse: null ==
              isThereLimitationsAfterFallOnCourse
          ? _self.isThereLimitationsAfterFallOnCourse
          : isThereLimitationsAfterFallOnCourse // ignore: cast_nullable_to_non_nullable
              as bool,
      limitationAfterFallOnCourse: freezed == limitationAfterFallOnCourse
          ? _self.limitationAfterFallOnCourse
          : limitationAfterFallOnCourse // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
