import 'package:safaqat/safaqat/domain/entities/events/event_attend.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_type.dart';

extension IntExtension on int? {
  int toIntOrZero() => this ?? 0;

  EventType toEventType() {
    switch (this) {
      case 0:
        return EventType.general;
      case 1:
        return EventType.conference;
      case 2:
        return EventType.exhibition;
      case 3:
        return EventType.trainingCourse;
      case 4:
        return EventType.seminar;
      case 5:
        return EventType.forum;
    }
    throw Exception('Not Valid');
  }

  EventAttend toEventAttend() {
    switch (this) {
      case 0:
        return EventAttend.online;
      case 1:
        return EventAttend.onsite;
      case 2:
        return EventAttend.both;
      case 3:
        return EventAttend.unspecified;
    }
    throw Exception('Not Valid');
  }
}

