import 'package:hive_flutter/hive_flutter.dart';

part 'section_model.g.dart';

@HiveType(typeId: 7)
class SectionModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool selected;

  @HiveField(2)
  int obtainedMark;

  @HiveField(3)
  int fullMark;

  SectionModel({
    required this.name,
    this.selected = false,
    this.obtainedMark = 0,
    this.fullMark = 0,
  });
}
