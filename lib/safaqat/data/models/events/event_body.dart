import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/events/stakeholder_dto.dart';

part 'publish_event_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PublishEventBody {
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
  @JsonKey(name: 'countryNo')
  int? countryNo;
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
  List<String>? tagsAr;
  @JsonKey(name: 'tagsE')
  List<String>? tagsEn;
  @JsonKey(name: 'stakeholders')
  List<Stakeholder>? stakeholders;


  PublishEventBody({
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

  factory PublishEventBody.fromJson(Map<String, dynamic> json) =>
      _$PublishEventBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PublishEventBodyToJson(this);

}
