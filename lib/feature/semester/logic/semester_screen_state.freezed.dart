// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'semester_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SemesterScreenState {
  String? get selectedTerm;
  int get selectedIndex;
  bool get selectionMode;
  int get selectedItem;
  List<SemesterModel> get semesters;
  List<CourseModel> get courses;
  double? get dropdownWidth;
  List<String> get grades;
  Color get headerColor;
  Color get bodyColor;

  /// Create a copy of SemesterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SemesterScreenStateCopyWith<SemesterScreenState> get copyWith =>
      _$SemesterScreenStateCopyWithImpl<SemesterScreenState>(
          this as SemesterScreenState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SemesterScreenState &&
            (identical(other.selectedTerm, selectedTerm) ||
                other.selectedTerm == selectedTerm) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            const DeepCollectionEquality().equals(other.semesters, semesters) &&
            const DeepCollectionEquality().equals(other.courses, courses) &&
            (identical(other.dropdownWidth, dropdownWidth) ||
                other.dropdownWidth == dropdownWidth) &&
            const DeepCollectionEquality().equals(other.grades, grades) &&
            (identical(other.headerColor, headerColor) ||
                other.headerColor == headerColor) &&
            (identical(other.bodyColor, bodyColor) ||
                other.bodyColor == bodyColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedTerm,
      selectedIndex,
      selectionMode,
      selectedItem,
      const DeepCollectionEquality().hash(semesters),
      const DeepCollectionEquality().hash(courses),
      dropdownWidth,
      const DeepCollectionEquality().hash(grades),
      headerColor,
      bodyColor);

  @override
  String toString() {
    return 'SemesterScreenState(selectedTerm: $selectedTerm, selectedIndex: $selectedIndex, selectionMode: $selectionMode, selectedItem: $selectedItem, semesters: $semesters, courses: $courses, dropdownWidth: $dropdownWidth, grades: $grades, headerColor: $headerColor, bodyColor: $bodyColor)';
  }
}

/// @nodoc
abstract mixin class $SemesterScreenStateCopyWith<$Res> {
  factory $SemesterScreenStateCopyWith(
          SemesterScreenState value, $Res Function(SemesterScreenState) _then) =
      _$SemesterScreenStateCopyWithImpl;
  @useResult
  $Res call(
      {String? selectedTerm,
      int selectedIndex,
      bool selectionMode,
      int selectedItem,
      List<SemesterModel> semesters,
      List<CourseModel> courses,
      double? dropdownWidth,
      List<String> grades,
      Color headerColor,
      Color bodyColor});
}

/// @nodoc
class _$SemesterScreenStateCopyWithImpl<$Res>
    implements $SemesterScreenStateCopyWith<$Res> {
  _$SemesterScreenStateCopyWithImpl(this._self, this._then);

  final SemesterScreenState _self;
  final $Res Function(SemesterScreenState) _then;

  /// Create a copy of SemesterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTerm = freezed,
    Object? selectedIndex = null,
    Object? selectionMode = null,
    Object? selectedItem = null,
    Object? semesters = null,
    Object? courses = null,
    Object? dropdownWidth = freezed,
    Object? grades = null,
    Object? headerColor = null,
    Object? bodyColor = null,
  }) {
    return _then(_self.copyWith(
      selectedTerm: freezed == selectedTerm
          ? _self.selectedTerm
          : selectedTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectionMode: null == selectionMode
          ? _self.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItem: null == selectedItem
          ? _self.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as int,
      semesters: null == semesters
          ? _self.semesters
          : semesters // ignore: cast_nullable_to_non_nullable
              as List<SemesterModel>,
      courses: null == courses
          ? _self.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      dropdownWidth: freezed == dropdownWidth
          ? _self.dropdownWidth
          : dropdownWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      grades: null == grades
          ? _self.grades
          : grades // ignore: cast_nullable_to_non_nullable
              as List<String>,
      headerColor: null == headerColor
          ? _self.headerColor
          : headerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bodyColor: null == bodyColor
          ? _self.bodyColor
          : bodyColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _SemesterScreenState implements SemesterScreenState {
  const _SemesterScreenState(
      {required this.selectedTerm,
      required this.selectedIndex,
      required this.selectionMode,
      required this.selectedItem,
      required final List<SemesterModel> semesters,
      required final List<CourseModel> courses,
      required this.dropdownWidth,
      final List<String> grades = const [],
      this.headerColor = const Color(0xFFF8F7B6),
      this.bodyColor = const Color(0xFFFFFEC6)})
      : _semesters = semesters,
        _courses = courses,
        _grades = grades;

  @override
  final String? selectedTerm;
  @override
  final int selectedIndex;
  @override
  final bool selectionMode;
  @override
  final int selectedItem;
  final List<SemesterModel> _semesters;
  @override
  List<SemesterModel> get semesters {
    if (_semesters is EqualUnmodifiableListView) return _semesters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_semesters);
  }

  final List<CourseModel> _courses;
  @override
  List<CourseModel> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  @override
  final double? dropdownWidth;
  final List<String> _grades;
  @override
  @JsonKey()
  List<String> get grades {
    if (_grades is EqualUnmodifiableListView) return _grades;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grades);
  }

  @override
  @JsonKey()
  final Color headerColor;
  @override
  @JsonKey()
  final Color bodyColor;

  /// Create a copy of SemesterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SemesterScreenStateCopyWith<_SemesterScreenState> get copyWith =>
      __$SemesterScreenStateCopyWithImpl<_SemesterScreenState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SemesterScreenState &&
            (identical(other.selectedTerm, selectedTerm) ||
                other.selectedTerm == selectedTerm) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            const DeepCollectionEquality()
                .equals(other._semesters, _semesters) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            (identical(other.dropdownWidth, dropdownWidth) ||
                other.dropdownWidth == dropdownWidth) &&
            const DeepCollectionEquality().equals(other._grades, _grades) &&
            (identical(other.headerColor, headerColor) ||
                other.headerColor == headerColor) &&
            (identical(other.bodyColor, bodyColor) ||
                other.bodyColor == bodyColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedTerm,
      selectedIndex,
      selectionMode,
      selectedItem,
      const DeepCollectionEquality().hash(_semesters),
      const DeepCollectionEquality().hash(_courses),
      dropdownWidth,
      const DeepCollectionEquality().hash(_grades),
      headerColor,
      bodyColor);

  @override
  String toString() {
    return 'SemesterScreenState(selectedTerm: $selectedTerm, selectedIndex: $selectedIndex, selectionMode: $selectionMode, selectedItem: $selectedItem, semesters: $semesters, courses: $courses, dropdownWidth: $dropdownWidth, grades: $grades, headerColor: $headerColor, bodyColor: $bodyColor)';
  }
}

/// @nodoc
abstract mixin class _$SemesterScreenStateCopyWith<$Res>
    implements $SemesterScreenStateCopyWith<$Res> {
  factory _$SemesterScreenStateCopyWith(_SemesterScreenState value,
          $Res Function(_SemesterScreenState) _then) =
      __$SemesterScreenStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? selectedTerm,
      int selectedIndex,
      bool selectionMode,
      int selectedItem,
      List<SemesterModel> semesters,
      List<CourseModel> courses,
      double? dropdownWidth,
      List<String> grades,
      Color headerColor,
      Color bodyColor});
}

/// @nodoc
class __$SemesterScreenStateCopyWithImpl<$Res>
    implements _$SemesterScreenStateCopyWith<$Res> {
  __$SemesterScreenStateCopyWithImpl(this._self, this._then);

  final _SemesterScreenState _self;
  final $Res Function(_SemesterScreenState) _then;

  /// Create a copy of SemesterScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedTerm = freezed,
    Object? selectedIndex = null,
    Object? selectionMode = null,
    Object? selectedItem = null,
    Object? semesters = null,
    Object? courses = null,
    Object? dropdownWidth = freezed,
    Object? grades = null,
    Object? headerColor = null,
    Object? bodyColor = null,
  }) {
    return _then(_SemesterScreenState(
      selectedTerm: freezed == selectedTerm
          ? _self.selectedTerm
          : selectedTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectionMode: null == selectionMode
          ? _self.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItem: null == selectedItem
          ? _self.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as int,
      semesters: null == semesters
          ? _self._semesters
          : semesters // ignore: cast_nullable_to_non_nullable
              as List<SemesterModel>,
      courses: null == courses
          ? _self._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseModel>,
      dropdownWidth: freezed == dropdownWidth
          ? _self.dropdownWidth
          : dropdownWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      grades: null == grades
          ? _self._grades
          : grades // ignore: cast_nullable_to_non_nullable
              as List<String>,
      headerColor: null == headerColor
          ? _self.headerColor
          : headerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bodyColor: null == bodyColor
          ? _self.bodyColor
          : bodyColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

// dart format on
