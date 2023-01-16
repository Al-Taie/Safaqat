
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/contract/service_dto.dart';

class ContractDto {
  ContractDto({
    this.contractId,
    this.projectId,
    this.nameAr,
    this.nameEn,
    this.contractorAr,
    this.contractorEn,
    this.status,
    this.value,
    this.currency,
    this.statusDesc,
    this.descriptionAr,
    this.descriptionEn,
    this.showPhone,
    this.showEmail,
    this.postStatus,
    this.startDate,
    this.finishDate,
    this.service,
    this.images,});

  ContractDto.fromJson(dynamic json) {
    contractId = json['contractId'];
    projectId = json['projId'];
    nameAr = json['contNameA'];
    nameEn = json['contNameE'];
    contractorAr = json['contractorA'];
    contractorEn = json['contractorE'];
    status = json['contStatus'];
    value = json['contValue'];
    currency = json['valueCurrency'];
    statusDesc = json['statusDesc'];
    descriptionAr = json['descA'];
    descriptionEn = json['descE'];
    showPhone = json['showTel'];
    showEmail = json['showEmail'];
    postStatus = json['postStatus'];
    startDate = json['startDate'];
    finishDate = json['finishDate'];
    service = json['serviceCode'] != null ? ServiceDto.fromJson(json['serviceCode']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  String? contractId;
  String? projectId;
  String? nameAr;
  String? nameEn;
  String? contractorAr;
  String? contractorEn;
  int? status;
  int? value;
  int? currency;
  dynamic statusDesc;
  String? descriptionAr;
  String? descriptionEn;
  bool? showPhone;
  bool? showEmail;
  int? postStatus;
  String? startDate;
  String? finishDate;
  ServiceDto? service;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contractId'] = contractId;
    map['projId'] = projectId;
    map['contNameA'] = nameAr;
    map['contNameE'] = nameEn;
    map['contractorA'] = contractorAr;
    map['contractorE'] = contractorEn;
    map['contStatus'] = status;
    map['contValue'] = value;
    map['valueCurrency'] = currency;
    map['statusDesc'] = statusDesc;
    map['descA'] = descriptionAr;
    map['descE'] = descriptionEn;
    map['showTel'] = showPhone;
    map['showEmail'] = showEmail;
    map['postStatus'] = postStatus;
    map['startDate'] = startDate;
    map['finishDate'] = finishDate;
    if (service != null) {
      map['serviceCode'] = service?.toJson();
    }
    map['images'] = images;
    return map;
  }

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';
  String get description => (Utils.isRTL ? descriptionAr : descriptionEn) ?? '-';

}
