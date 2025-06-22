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
  StudentModel get student;
  List<SemesterModel> get semesters;
  bool get selectionMode;
  int get selectedItem;
  List<Map<String, dynamic>> get searchResults;
  bool get showSearchOverlay;

  /// Create a copy of ApplicationAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApplicationAppBarStateCopyWith<ApplicationAppBarState> get copyWith =>
      _$ApplicationAppBarStateCopyWithImpl<ApplicationAppBarState>(
          this as ApplicationAppBarState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApplicationAppBarState &&
            (identical(other.student, student) || other.student == student) &&
            const DeepCollectionEquality().equals(other.semesters, semesters) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            const DeepCollectionEquality()
                .equals(other.searchResults, searchResults) &&
            (identical(other.showSearchOverlay, showSearchOverlay) ||
                other.showSearchOverlay == showSearchOverlay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      student,
      const DeepCollectionEquality().hash(semesters),
      selectionMode,
      selectedItem,
      const DeepCollectionEquality().hash(searchResults),
      showSearchOverlay);

  @override
  String toString() {
    return 'ApplicationAppBarState(student: $student, semesters: $semesters, selectionMode: $selectionMode, selectedItem: $selectedItem, searchResults: $searchResults, showSearchOverlay: $showSearchOverlay)';
  }
}

/// @nodoc
abstract mixin class $ApplicationAppBarStateCopyWith<$Res> {
  factory $ApplicationAppBarStateCopyWith(ApplicationAppBarState value,
          $Res Function(ApplicationAppBarState) _then) =
      _$ApplicationAppBarStateCopyWithImpl;
  @useResult
  $Res call(
      {StudentModel student,
      List<SemesterModel> semesters,
      bool selectionMode,
      int selectedItem,
      List<Map<String, dynamic>> searchResults,
      bool showSearchOverlay});
}

/// @nodoc
class _$ApplicationAppBarStateCopyWithImpl<$Res>
    implements $ApplicationAppBarStateCopyWith<$Res> {
  _$ApplicationAppBarStateCopyWithImpl(this._self, this._then);

  final ApplicationAppBarState _self;
  final $Res Function(ApplicationAppBarState) _then;

  /// Create a copy of ApplicationAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? student = null,
    Object? semesters = null,
    Object? selectionMode = null,
    Object? selectedItem = null,
    Object? searchResults = null,
    Object? showSearchOverlay = null,
  }) {
    return _then(_self.copyWith(
      student: null == student
          ? _self.student
          : student // ignore: cast_nullable_to_non_nullable
              as StudentModel,
      semesters: null == semesters
          ? _self.semesters
          : semesters // ignore: cast_nullable_to_non_nullable
              as List<SemesterModel>,
      selectionMode: null == selectionMode
          ? _self.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItem: null == selectedItem
          ? _self.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as int,
      searchResults: null == searchResults
          ? _self.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      showSearchOverlay: null == showSearchOverlay
          ? _self.showSearchOverlay
          : showSearchOverlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _ApplicationAppBarState implements ApplicationAppBarState {
  const _ApplicationAppBarState(
      {required this.student,
      required final List<SemesterModel> semesters,
      this.selectionMode = false,
      this.selectedItem = 0,
      final List<Map<String, dynamic>> searchResults = const [],
      this.showSearchOverlay = false})
      : _semesters = semesters,
        _searchResults = searchResults;

  @override
  final StudentModel student;
  final List<SemesterModel> _semesters;
  @override
  List<SemesterModel> get semesters {
    if (_semesters is EqualUnmodifiableListView) return _semesters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_semesters);
  }

  @override
  @JsonKey()
  final bool selectionMode;
  @override
  @JsonKey()
  final int selectedItem;
  final List<Map<String, dynamic>> _searchResults;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  @JsonKey()
  final bool showSearchOverlay;

  /// Create a copy of ApplicationAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApplicationAppBarStateCopyWith<_ApplicationAppBarState> get copyWith =>
      __$ApplicationAppBarStateCopyWithImpl<_ApplicationAppBarState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApplicationAppBarState &&
            (identical(other.student, student) || other.student == student) &&
            const DeepCollectionEquality()
                .equals(other._semesters, _semesters) &&
            (identical(other.selectionMode, selectionMode) ||
                other.selectionMode == selectionMode) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.showSearchOverlay, showSearchOverlay) ||
                other.showSearchOverlay == showSearchOverlay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      student,
      const DeepCollectionEquality().hash(_semesters),
      selectionMode,
      selectedItem,
      const DeepCollectionEquality().hash(_searchResults),
      showSearchOverlay);

  @override
  String toString() {
    return 'ApplicationAppBarState(student: $student, semesters: $semesters, selectionMode: $selectionMode, selectedItem: $selectedItem, searchResults: $searchResults, showSearchOverlay: $showSearchOverlay)';
  }
}

/// @nodoc
abstract mixin class _$ApplicationAppBarStateCopyWith<$Res>
    implements $ApplicationAppBarStateCopyWith<$Res> {
  factory _$ApplicationAppBarStateCopyWith(_ApplicationAppBarState value,
          $Res Function(_ApplicationAppBarState) _then) =
      __$ApplicationAppBarStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {StudentModel student,
      List<SemesterModel> semesters,
      bool selectionMode,
      int selectedItem,
      List<Map<String, dynamic>> searchResults,
      bool showSearchOverlay});
}

/// @nodoc
class __$ApplicationAppBarStateCopyWithImpl<$Res>
    implements _$ApplicationAppBarStateCopyWith<$Res> {
  __$ApplicationAppBarStateCopyWithImpl(this._self, this._then);

  final _ApplicationAppBarState _self;
  final $Res Function(_ApplicationAppBarState) _then;

  /// Create a copy of ApplicationAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? student = null,
    Object? semesters = null,
    Object? selectionMode = null,
    Object? selectedItem = null,
    Object? searchResults = null,
    Object? showSearchOverlay = null,
  }) {
    return _then(_ApplicationAppBarState(
      student: null == student
          ? _self.student
          : student // ignore: cast_nullable_to_non_nullable
              as StudentModel,
      semesters: null == semesters
          ? _self._semesters
          : semesters // ignore: cast_nullable_to_non_nullable
              as List<SemesterModel>,
      selectionMode: null == selectionMode
          ? _self.selectionMode
          : selectionMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItem: null == selectedItem
          ? _self.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as int,
      searchResults: null == searchResults
          ? _self._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      showSearchOverlay: null == showSearchOverlay
          ? _self.showSearchOverlay
          : showSearchOverlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
