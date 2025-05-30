// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseScreenState {
  String? get selectedCourseName;
  int get selectedTermIndex;
  int get selectedCourseIndex;
  bool get selectionMode;
  int get selectedSections;
  List<CourseModel> get courses;
  List<SectionModel> get sections;
  double? get dropdownWidth;

  /// Create a copy of CourseScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseScreenStateCopyWith<CourseScreenState> get copyWith =>
      _$CourseScreenStateCopyWithImpl<CourseScreenState>(
          this as CourseScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseScreenState &&
            (identical(other.selectedCourseName, selectedCourseName) ||
                other.selectedCourseName == selectedCourseName) &&
            (identical(other.selectedTermIndex, selectedTermIndex) ||
                other.selectedTermIndex == selectedTermIndex) &&
            (identical(other.selectedCourseIndex, selectedCourseIndex) ||
                other.selectedCourseIndex == selectedCourseIndex) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode) &&
            (identical(other.selectedSections, selectedSections) ||
                other.selectedSections == selectedSections) &&
            const DeepCollectionEquality().equals(other.courses, courses) &&
            const DeepCollectionEquality().equals(other.sections, sections) &&
            (identical(other.dropdownWidth, dropdownWidth) ||
                other.dropdownWidth == dropdownWidth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedCourseName,
      selectedTermIndex,
      selectedCourseIndex,
      selectionMode,
      selectedSections,
      const DeepCollectionEquality().hash(courses),
      const DeepCollectionEquality().hash(sections),
      dropdownWidth);

  @override
  String toString() {
    return 'CourseScreenState(selectedCourseName: $selectedCourseName, selectedTermIndex: $selectedTermIndex, selectedCourseIndex: $selectedCourseIndex, selectionMode: $selectionMode, selectedSections: $selectedSections, courses: $courses, sections: $sections, dropdownWidth: $dropdownWidth)';
  }
}

/// @nodoc
abstract mixin class $CourseScreenStateCopyWith<$Res> {
  factory $CourseScreenStateCopyWith(
          CourseScreenState value, $Res Function(CourseScreenState) _then) =
      _$CourseScreenStateCopyWithImpl;
  @useResult
  $Res call(
      {String? selectedCourseName,
      int selectedTermIndex,
      int selectedCourseIndex,
      bool selectionMode,
      int selectedSections,
      List<CourseModel> courses,
      List<SectionModel> sections,
      double? dropdownWidth});
}

/// @nodoc
class _$CourseScreenStateCopyWithImpl<$Res>
    implements $CourseScreenStateCopyWith<$Res> {
  _$CourseScreenStateCopyWithImpl(this._self, this._then);

  final CourseScreenState _self;
  final $Res Function(CourseScreenState) _then;

  /// Create a copy of CourseScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCourseName = freezed,
    Object? selectedTermIndex = null,
    Object? selectedCourseIndex = null,
    Object? selectionMode = null,
    Object? selectedSections = null,
    Object? courses = null,
    Object? sections = null,
    Object? dropdownWidth = freezed,
  }) {
    return _then(_self.copyWith(
      selectedCourseName: freezed == selectedCourseName
          ? _self.selectedCourseName
          : selectedCourseName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTermIndex: null == selectedTermIndex
          ? _self.selectedTermIndex
          : selectedTermIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCourseIndex: null == selectedCourseIndex
          ? _self.selectedCourseIndex
          : selectedCourseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectionMode: null == selectionMode
          ? _self.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedSections: null == selectedSections
          ? _self.selectedSections
          : selectedSections // ignore: cast_nullable_to_non_nullable
              as int,
      courses: null == courses
          ? _self.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      sections: null == sections
          ? _self.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<SectionModel>,
      dropdownWidth: freezed == dropdownWidth
          ? _self.dropdownWidth
          : dropdownWidth // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _CourseScreenState implements CourseScreenState {
  const _CourseScreenState(
      {required this.selectedCourseName,
      required this.selectedTermIndex,
      required this.selectedCourseIndex,
      required this.selectionMode,
      required this.selectedSections,
      required final List<CourseModel> courses,
      required final List<SectionModel> sections,
      required this.dropdownWidth})
      : _courses = courses,
        _sections = sections;

  @override
  final String? selectedCourseName;
  @override
  final int selectedTermIndex;
  @override
  final int selectedCourseIndex;
  @override
  final bool selectionMode;
  @override
  final int selectedSections;
  final List<CourseModel> _courses;
  @override
  List<CourseModel> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  final List<SectionModel> _sections;
  @override
  List<SectionModel> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  final double? dropdownWidth;

  /// Create a copy of CourseScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseScreenStateCopyWith<_CourseScreenState> get copyWith =>
      __$CourseScreenStateCopyWithImpl<_CourseScreenState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseScreenState &&
            (identical(other.selectedCourseName, selectedCourseName) ||
                other.selectedCourseName == selectedCourseName) &&
            (identical(other.selectedTermIndex, selectedTermIndex) ||
                other.selectedTermIndex == selectedTermIndex) &&
            (identical(other.selectedCourseIndex, selectedCourseIndex) ||
                other.selectedCourseIndex == selectedCourseIndex) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode) &&
            (identical(other.selectedSections, selectedSections) ||
                other.selectedSections == selectedSections) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.dropdownWidth, dropdownWidth) ||
                other.dropdownWidth == dropdownWidth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedCourseName,
      selectedTermIndex,
      selectedCourseIndex,
      selectionMode,
      selectedSections,
      const DeepCollectionEquality().hash(_courses),
      const DeepCollectionEquality().hash(_sections),
      dropdownWidth);

  @override
  String toString() {
    return 'CourseScreenState(selectedCourseName: $selectedCourseName, selectedTermIndex: $selectedTermIndex, selectedCourseIndex: $selectedCourseIndex, selectionMode: $selectionMode, selectedSections: $selectedSections, courses: $courses, sections: $sections, dropdownWidth: $dropdownWidth)';
  }
}

/// @nodoc
abstract mixin class _$CourseScreenStateCopyWith<$Res>
    implements $CourseScreenStateCopyWith<$Res> {
  factory _$CourseScreenStateCopyWith(
          _CourseScreenState value, $Res Function(_CourseScreenState) _then) =
      __$CourseScreenStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? selectedCourseName,
      int selectedTermIndex,
      int selectedCourseIndex,
      bool selectionMode,
      int selectedSections,
      List<CourseModel> courses,
      List<SectionModel> sections,
      double? dropdownWidth});
}

/// @nodoc
class __$CourseScreenStateCopyWithImpl<$Res>
    implements _$CourseScreenStateCopyWith<$Res> {
  __$CourseScreenStateCopyWithImpl(this._self, this._then);

  final _CourseScreenState _self;
  final $Res Function(_CourseScreenState) _then;

  /// Create a copy of CourseScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedCourseName = freezed,
    Object? selectedTermIndex = null,
    Object? selectedCourseIndex = null,
    Object? selectionMode = null,
    Object? selectedSections = null,
    Object? courses = null,
    Object? sections = null,
    Object? dropdownWidth = freezed,
  }) {
    return _then(_CourseScreenState(
      selectedCourseName: freezed == selectedCourseName
          ? _self.selectedCourseName
          : selectedCourseName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTermIndex: null == selectedTermIndex
          ? _self.selectedTermIndex
          : selectedTermIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCourseIndex: null == selectedCourseIndex
          ? _self.selectedCourseIndex
          : selectedCourseIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectionMode: null == selectionMode
          ? _self.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedSections: null == selectedSections
          ? _self.selectedSections
          : selectedSections // ignore: cast_nullable_to_non_nullable
              as int,
      courses: null == courses
          ? _self._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      sections: null == sections
          ? _self._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<SectionModel>,
      dropdownWidth: freezed == dropdownWidth
          ? _self.dropdownWidth
          : dropdownWidth // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
