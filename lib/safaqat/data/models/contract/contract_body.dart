import 'dart:io';

import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';

class ContractBody {
  ContractBody({
    this.projectId,
    this.nameAr,
    this.nameEn,
    this.startDate,
    this.endDate,
    this.descriptionAr,
    this.descriptionEn,
    this.contractorNameAr,
    this.contractorNameEn,
    this.currency,
    this.value,
    this.serviceCode,
    this.showInPostPage,
    this.showPhone,
    this.showEmail,
    this.images,
  });

  String? nameAr;
  String? nameEn;
  String? startDate;
  String? endDate;
  String? projectId;
  String? contractorNameAr;
  String? contractorNameEn;
  double? value;
  int? currency;
  int? serviceCode;
  bool? showInPostPage;
  String? descriptionAr;
  String? descriptionEn;
  bool? showPhone;
  bool? showEmail;
  List<File>? images;
}
