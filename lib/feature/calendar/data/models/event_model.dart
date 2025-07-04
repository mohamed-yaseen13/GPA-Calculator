import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'event_model.g.dart';

@HiveType(typeId: 5)
class EventModel extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final int colorValue;

  EventModel({
    required this.date,
    required this.title,
    this.description,
    Color? color,
  }) : colorValue = (color ?? Colors.blue[100]!).toARGB32();

  Color get color => Color(colorValue);

  EventModel copyWith({
    DateTime? date,
    String? title,
    String? description,
    Color? color,
  }) {
    return EventModel(
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
    );
  }
}
