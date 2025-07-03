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

  EventModel({required this.date, required this.title, this.description});

  EventModel copyWith({DateTime? date, String? title, String? description}) {
    return EventModel(
      date: date ?? this.date,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
