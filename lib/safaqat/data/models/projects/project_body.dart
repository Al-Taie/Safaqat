import 'dart:ffi';
import 'dart:io';

import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_convener_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_sector_dto.dart';

class ProjectBody {
  ProjectBody({
    this.id,
    this.nameAr,
    this.nameEn,
    this.instituteNameAr,
    this.instituteNameEn,
    this.startDate,
    this.endDate,
    this.actualEndDate,
    this.convener,
    this.sector,
    this.city,
    this.category,
    this.coordinates,
    this.cost,
    this.descriptionAr,
    this.descriptionEn,
    this.showPhone,
    this.showEmail,
    this.images,
  });

  String? id;
  String? nameAr;
  String? nameEn;
  String? instituteNameAr;
  String? instituteNameEn;
  String? startDate;
  String? endDate;
  String? actualEndDate;
  ProjectConvenerDto? convener;
  ProjectSectorDto? sector;
  CityDto? city;
  PostCategoryDto? category;
  CoordinatesDto? coordinates;
  Float? cost;
  String? descriptionAr;
  String? descriptionEn;
  bool? showPhone;
  bool? showEmail;
  List<File>? images;
}
