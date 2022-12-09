import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';


@JsonSerializable(ignoreUnannotated: false)
class EventsResponse {
  @JsonKey(name: 'numberOfPages')
  int? numberOfPages;
  @JsonKey(name: 'events')
  List<EventDto>? events;

  EventsResponse({this.numberOfPages, this.events});
}
