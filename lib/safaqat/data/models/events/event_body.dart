import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/events/event_coordinates.dart';
import 'package:safaqat/safaqat/data/models/events/stakeholder_dto.dart';

part 'event_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class EventBody {
  @JsonKey(name: 'EventTitleA')
  String? titleAr;
  @JsonKey(name: 'EventTitleE')
  String? titleEn;
  @JsonKey(name: 'EventDetailsA')
  String? detailsAr;
  @JsonKey(name: 'EventDetailsE')
  String? detailsEn;
  @JsonKey(name: 'EventType')
  int? type;
  @JsonKey(name: 'EAttendanceType')
  int? attendanceType;
  @JsonKey(name: 'CountryNo')
  int? countryNo;
  @JsonKey(name: 'CityCode')
  int? cityCode;
  @JsonKey(name: 'Coordinates')
  EventCoordinates? coordinates;
  @JsonKey(name: 'StartDate')
  String? startDate;
  @JsonKey(name: 'EndDate')
  String? endDate;
  @JsonKey(name: 'Telephone')
  String? telephone;
  @JsonKey(name: 'Email')
  String? email;
  @JsonKey(name: 'WebSite')
  String? webSite;
  @JsonKey(name: 'ShowName')
  bool? showName;
  @JsonKey(name: 'TagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'TagsE')
  List<String>? tagsEn;
  @JsonKey(name: 'Stakeholder')
  List<Stakeholder>? stakeholders;


  EventBody({
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.type,
    this.attendanceType,
    this.countryNo,
    this.cityCode,
    this.coordinates,
    this.startDate,
    this.endDate,
    this.telephone,
    this.email,
    this.webSite,
    this.showName,
    this.tagsAr,
    this.tagsEn,
    this.stakeholders,
  });

  factory EventBody.fromJson(Map<String, dynamic> json) =>
      _$EventBodyFromJson(json);

  Map<String, dynamic> toJson() => _$EventBodyToJson(this);

}
