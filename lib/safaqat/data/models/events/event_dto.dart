

import 'package:json_annotation/json_annotation.dart';

class EventDto{
  @JsonKey(name: 'eventId')
  String? id;
  @JsonKey(name: 'eventTitleA')
  String? titleAr;
  @JsonKey(name: 'eventTitleE')
  String? titleEn;
  @JsonKey(name: 'eventDetailsA')
  String? detailsAr;
  @JsonKey(name: 'eventDetailsE')
  String? detailsEn;
  @JsonKey(name: 'postDate')
  String? date;
  @JsonKey(name: 'showName')
  bool showName;
  @JsonKey(name: 'tagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'tagsE')
  List<String>? tagsEn;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(name: 'eventStatus')
  int? status;
  @JsonKey(name: 'statusDesc')
  String? statusDescription;
  @JsonKey(name: 'ownerName')
  String? ownerName;

  EventDto({
    this.id,
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.date,
    this.showName = false,
    this.tagsAr,
    this.tagsEn,
    this.images,
    this.status,
    this.statusDescription,
    this.ownerName,
  });
}
