
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
    this.contractStatus,
    this.value,
    this.currency,
    this.statusDesc,
    this.descriptionAr,
    this.descriptionEn,
    this.phone,
    this.email,
    this.showPhone,
    this.showEmail,
    this.postStatus,
    this.startDate,
    this.endDate,
    this.service,
    this.images,});

  ContractDto.fromJson(dynamic json) {
    contractId = json['contractId'];
    projectId = json['projId'];
    nameAr = json['contNameA'];
    nameEn = json['contNameE'];
    contractorAr = json['contractorA'];
    contractorEn = json['contractorE'];
    contractStatus = json['contStatus'];
    value = json['contValue'];
    currency = json['valueCurrency'];
    statusDesc = json['statusDesc'];
    descriptionAr = json['descA'];
    descriptionEn = json['descE'];
    phone = json['telephone'];
    email = json['email'];
    showPhone = json['showTel'];
    showEmail = json['showEmail'];
    postStatus = json['postStatus'];
    startDate = json['startDate'];
    endDate = json['finishDate'];
    service = json['serviceCode'] != null ? ServiceDto.fromJson(json['serviceCode']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }

  String? contractId;
  String? projectId;
  String? nameAr;
  String? nameEn;
  String? contractorAr;
  String? contractorEn;
  int? contractStatus;
  int? value;
  int? currency;
  dynamic statusDesc;
  String? descriptionAr;
  String? descriptionEn;
  String? phone;
  String? email;
  bool? showPhone;
  bool? showEmail;
  int? postStatus;
  String? startDate;
  String? endDate;
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
    map['contStatus'] = contractStatus;
    map['contValue'] = value;
    map['valueCurrency'] = currency;
    map['statusDesc'] = statusDesc;
    map['descA'] = descriptionAr;
    map['descE'] = descriptionEn;
    map['telephone'] = phone;
    map['email'] = email;
    map['showTel'] = showPhone;
    map['showEmail'] = showEmail;
    map['postStatus'] = postStatus;
    map['startDate'] = startDate;
    map['finishDate'] = endDate;
    if (service != null) {
      map['serviceCode'] = service?.toJson();
    }
    map['images'] = images;
    return map;
  }

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';
  String get contractor => (Utils.isRTL ? contractorAr : contractorEn) ?? '-';
  String get description => (Utils.isRTL ? descriptionAr : descriptionEn) ?? '-';

  @override
  String toString(){
    return '$nameAr,$nameEn,$contractorAr,$contractorEn,'
        '$projectId';
  }
}
