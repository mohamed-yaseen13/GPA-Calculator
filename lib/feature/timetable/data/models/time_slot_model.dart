import 'package:hive_flutter/hive_flutter.dart';

part 'time_slot_model.g.dart';

@HiveType(typeId: 6)
class TimeSlotModel extends HiveObject {
  @HiveField(0)
  String day;

  @HiveField(1)
  String interval;

  @HiveField(2)
  String type;

  @HiveField(3)
  String content;

  TimeSlotModel({
    required this.content,
    required this.day,
    required this.interval,
    required this.type,
  });

  TimeSlotModel copyWith({
    String? day,
    String? interval,
    String? type,
    String? content,
  }) {
    return TimeSlotModel(
      content: content ?? this.content,
      day: day ?? this.day,
      interval: interval ?? this.interval,
      type: type ?? this.type,
    );
  }
}
