class CourseModel {
  String name;

  String grade;

  double credits;

  bool selected;

  CourseModel({
    required this.credits,
    required this.grade,
    required this.name,
    required this.selected,
  });

  @override
  String toString() {
    return 'CourseModel(name: $name, grade: $grade, selected: $selected, credits: $credits)';
  }
}
