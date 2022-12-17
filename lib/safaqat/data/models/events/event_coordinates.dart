import 'package:json_annotation/json_annotation.dart'; 

part 'event_coordinates.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class EventCoordinates {
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;

  EventCoordinates({this.latitude, this.longitude});

   factory EventCoordinates.fromJson(Map<String, dynamic> json) => _$EventCoordinatesFromJson(json);

   Map<String, dynamic> toJson() => _$EventCoordinatesToJson(this);

   @override
   String toString() => '$longitude,$latitude';
}

