
import 'package:safaqat/safaqat/app/utils/utils.dart';

class ContractingDto {
  ContractingDto({
    this.contractId,
    this.projectId,
    this.nameAr,
    this.nameEn,
    this.status,
    this.contractorAr,
    this.contractorEn,
    this.value,
    this.currency,
    this.startDate,
    this.finishDate,
    this.serviceCode,
    this.descriptionAr,
    this.descriptionEn,
    this.showInPostPage,
    this.showPhone,
    this.showEmail,
    this.postStatus,
    this.statusDesc,
    this.project,
    this.serviceCodeNavigation,});

  ContractingDto.fromJson(dynamic json) {
    contractId = json['contractId'];
    projectId = json['projId'];
    nameAr = json['contNameA'];
    nameEn = json['contNameE'];
    status = json['contStatus'];
    contractorAr = json['contractorA'];
    contractorEn = json['contractorE'];
    value = json['contValue'];
    currency = json['valueCurrency'];
    startDate = json['startDate'];
    finishDate = json['finishDate'];
    serviceCode = json['serviceCode'];
    descriptionAr = json['descA'];
    descriptionEn = json['descE'];
    showInPostPage = json['showInPostPage'];
    showPhone = json['showTel'];
    showEmail = json['showEmail'];
    postStatus = json['postStatus'];
    statusDesc = json['statusDesc'];
    project = json['proj'];
    serviceCodeNavigation = json['serviceCodeNavigation'];
  }

  String? contractId;
  String? projectId;
  String? nameAr;
  String? nameEn;
  int? status;
  String? contractorAr;
  String? contractorEn;
  int? value;
  int? currency;
  String? startDate;
  String? finishDate;
  int? serviceCode;
  String? descriptionAr;
  String? descriptionEn;
  bool? showInPostPage;
  bool? showPhone;
  bool? showEmail;
  int? postStatus;
  dynamic statusDesc;
  dynamic project;
  dynamic serviceCodeNavigation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contractId'] = contractId;
    map['projId'] = projectId;
    map['contNameA'] = nameAr;
    map['contNameE'] = nameEn;
    map['contStatus'] = status;
    map['contractorA'] = contractorAr;
    map['contractorE'] = contractorEn;
    map['contValue'] = value;
    map['valueCurrency'] = currency;
    map['startDate'] = startDate;
    map['finishDate'] = finishDate;
    map['serviceCode'] = serviceCode;
    map['descA'] = descriptionAr;
    map['descE'] = descriptionEn;
    map['showInPostPage'] = showInPostPage;
    map['showTel'] = showPhone;
    map['showEmail'] = showEmail;
    map['postStatus'] = postStatus;
    map['statusDesc'] = statusDesc;
    map['proj'] = project;
    map['serviceCodeNavigation'] = serviceCodeNavigation;
    return map;
  }

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';
  String get description => (Utils.isRTL ? descriptionAr : descriptionEn) ?? '-';

}
