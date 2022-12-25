import 'package:safaqat/safaqat/app/config/strings.dart';

enum EventType {
  general,
  conference,
  trainingCourse,
  exhibition,
  seminar,
  forum;

  static List<EventType> get items => values;

  @override
  String toString() {
    switch (this) {
      case EventType.general:
        return AppStrings.general;
      case EventType.conference:
        return AppStrings.conference;
      case EventType.exhibition:
        return AppStrings.exhibition;
      case EventType.trainingCourse:
        return AppStrings.trainingCourse;
      case EventType.seminar:
        return AppStrings.seminar;
      case EventType.forum:
        return AppStrings.forum;
    }
  }
}
