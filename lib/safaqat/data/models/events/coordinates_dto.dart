import 'package:json_annotation/json_annotation.dart'; 

part 'coordinates_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CoordinatesDto {
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;

  CoordinatesDto({this.latitude, this.longitude});

   factory CoordinatesDto.fromJson(Map<String, dynamic> json) => _$CoordinatesDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CoordinatesDtoToJson(this);

   @override
   String toString() => '$longitude,$latitude';
}

