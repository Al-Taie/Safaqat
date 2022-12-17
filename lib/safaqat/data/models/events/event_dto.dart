import 'package:json_annotation/json_annotation.dart'; 

part 'event_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class EventDto {
  @JsonKey(name: 'eventId')
  String? eventId;
  @JsonKey(name: 'ownerName')
  String? ownerName;
  @JsonKey(name: 'eventTitleA')
  String? eventTitleA;
  @JsonKey(name: 'eventTitleE')
  String? eventTitleE;
  @JsonKey(name: 'eventDetailsA')
  String? eventDetailsA;
  @JsonKey(name: 'eventDetailsE')
  String? eventDetailsE;
  @JsonKey(name: 'eventType')
  int? eventType;
  @JsonKey(name: 'eAttendanceType')
  int? eAttendanceType;
  @JsonKey(name: 'countryNo')
  int? countryNo;
  @JsonKey(name: 'countryNameA')
  String? countryNameA;
  @JsonKey(name: 'countryNameE')
  String? countryNameE;
  @JsonKey(name: 'cityNameA')
  String? cityNameA;
  @JsonKey(name: 'cityNameE')
  String? cityNameE;
  @JsonKey(name: 'cityCode')
  int? cityCode;
  @JsonKey(name: 'coordinates')
  String? coordinates;
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
  List<String>? tagsA;
  @JsonKey(name: 'tagsE')
  List<String>? tagsE;
  @JsonKey(name: 'postStatus')
  int? postStatus;
  @JsonKey(name: 'statusDesc')
  Null? statusDesc;
  @JsonKey(name: 'stakeholders')
  List<Stakeholder>? stakeholders;
  @JsonKey(name: 'postDate')
  String? postDate;

  EventDto({this.eventId, this.ownerName, this.eventTitleA, this.eventTitleE, this.eventDetailsA, this.eventDetailsE, this.eventType, this.eAttendanceType, this.countryNo, this.countryNameA, this.countryNameE, this.cityNameA, this.cityNameE, this.cityCode, this.coordinates, this.startDate, this.endDate, this.telephone, this.email, this.webSite, this.showName, this.tagsA, this.tagsE, this.postStatus, this.statusDesc, this.stakeholders, this.postDate});

   factory EventDto.fromJson(Map<String, dynamic> json) => _$EventDtoFromJson(json);

   Map<String, dynamic> toJson() => _$EventDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Stakeholder {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'order')
  int? order;
  @JsonKey(name: 'type')
  int? type;
  @JsonKey(name: 'sponsorType')
  String? sponsorType;
  @JsonKey(name: 'logo')
  String? logo;

  Stakeholder({this.name, this.order, this.type, this.sponsorType, this.logo});

   factory Stakeholder.fromJson(Map<String, dynamic> json) => _$StakeholderFromJson(json);

   Map<String, dynamic> toJson() => _$StakeholderToJson(this);
}

