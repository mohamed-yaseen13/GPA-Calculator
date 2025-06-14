import 'package:hive_flutter/hive_flutter.dart';

part 'section_model.g.dart';

@HiveType(typeId: 0)
class SectionModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool selected;

  @HiveField(2)
  double obtainedMark;

  @HiveField(3)
  int fullMark;

  SectionModel({
    required this.name,
    this.selected = false,
    this.obtainedMark = 0,
    this.fullMark = 0,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'selected': selected,
    'obtainedMark': obtainedMark,
    'fullMark': fullMark,
  };

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
    name: json['name'] as String,
    selected: json['selected'] as bool,
    obtainedMark: json['obtainedMark'] as double,
    fullMark: json['fullMark'] as int,
  );
}
