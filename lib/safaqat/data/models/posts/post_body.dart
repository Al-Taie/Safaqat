import 'dart:io';

import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';


class PostBody {
  PostBody({
    this.id,
    this.titleAr,
    this.titleEn,
    this.instituteNameAr,
    this.instituteNameEn,
    this.type,
    this.categoryCode,
    this.city,
    this.costCode,
    this.descriptionAr,
    this.descriptionEn,
    this.coordinates,
    this.expiryDate,
    this.showPhone,
    this.showEmail,
    this.images,
  });

  String? id;
  String? titleAr;
  String? titleEn;
  String? instituteNameAr;
  String? instituteNameEn;
  int? type;
  int? categoryCode;
  String? expiryDate;
  CityDto? city;
  int? costCode;
  String? descriptionAr;
  String? descriptionEn;
  CoordinatesDto? coordinates;
  bool? showPhone;
  bool? showEmail;
  List<File>? images;
}
