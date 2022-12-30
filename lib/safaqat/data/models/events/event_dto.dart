import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/data/models/events/stakeholder_dto.dart';

part 'event_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class EventDto {
  @JsonKey(name: 'eventId')
  String? id;
  @JsonKey(name: 'ownerName')
  String? ownerName;
  @JsonKey(name: 'eventTitleA')
  String? titleAr;
  @JsonKey(name: 'eventTitleE')
  String? titleEn;
  @JsonKey(name: 'eventDetailsA')
  String? detailsAr;
  @JsonKey(name: 'eventDetailsE')
  String? detailsEn;
  @JsonKey(name: 'eventType')
  int? type;
  @JsonKey(name: 'eAttendanceType')
  int? attendanceType;
  @JsonKey(name: 'country')
  CountryDto? country;
  @JsonKey(name: 'city')
  CityDto? city;
  @JsonKey(name: 'coordinates')
  CoordinatesDto? coordinates;
  @JsonKey(name: 'startDate')
  String? startDate;
  @JsonKey(name: 'endDate')
  String? endDate;
  @JsonKey(name: 'telephone')
  String? telephone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'webSite')
  String? webSite;
  @JsonKey(name: 'showName')
  bool? showName;
  @JsonKey(name: 'tagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'tagsE')
  List<String>? tagsEn;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(name: 'postStatus')
  int? postStatus;
  @JsonKey(name: 'statusDesc')
  String? statusDesc;
  @JsonKey(name: 'stakeholders')
  List<StakeholderDto>? stakeholders;
  @JsonKey(name: 'postDate')
  String? postDate;

  EventDto({
    this.id,
    this.ownerName,
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.type,
    this.attendanceType,
    this.country,
    this.city,
    this.coordinates,
    this.startDate,
    this.endDate,
    this.telephone,
    this.email,
    this.webSite,
    this.showName,
    this.tagsAr,
    this.tagsEn,
    this.images,
    this.postStatus,
    this.statusDesc,
    this.stakeholders,
    this.postDate,
  });

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventDtoToJson(this);

  @override
  String toString() {
    return '$titleAr,$titleEn,$detailsAr,$detailsEn,$telephone,$webSite,$email,$country,$city'.toLowerCase();
  }
}
