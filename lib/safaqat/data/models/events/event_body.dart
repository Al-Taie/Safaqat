import 'dart:io';

import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/domain/entities/events/stakeholder.dart';

class EventBody {
  String? titleAr;
  String? titleEn;
  String? detailsAr;
  String? detailsEn;
  int? type;
  int? attendanceType;
  int? countryNo;
  int? cityCode;
  EventCoordinates? coordinates;
  String? startDate;
  String? endDate;
  String? telephone;
  String? email;
  String? webSite;
  bool? showName;
  List<String>? tagsAr;
  List<String>? tagsEn;
  List<File>? images;
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
    this.images,
    this.stakeholders,
  });
}
