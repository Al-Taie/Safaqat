import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';

part 'events_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class EventsResponse {
  @JsonKey(name: 'numberOfPages')
  int? numberOfPages;
  @JsonKey(name: 'event')
  List<EventDto>? events;

  EventsResponse({this.numberOfPages, this.events});

  factory EventsResponse.fromJson(Map<String, dynamic> json) => _$EventsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventsResponseToJson(this);
}
