import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/contract/contrating_dto.dart';


class ServiceDto {

  ServiceDto({this.code, this.nameAr, this.nameEn, this.contractings});

  ServiceDto.fromJson(dynamic json) {
    code = json['serviceCode'];
    nameAr = json['serviceNameA'];
    nameEn = json['serviceNameE'];
    if (json['contractings'] != null) {
      contractings = [];
      json['contractings'].forEach((v) {
        contractings?.add(ContractingDto.fromJson(v));
      });
    }
  }

  int? code;
  String? nameAr;
  String? nameEn;
  List<ContractingDto>? contractings;

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';


  @override
  int get hashCode => code ?? 0;

  @override
  bool operator ==(Object other) {
    if (other is! ServiceDto) return false;
    if (code != other.code) return false;
    if (nameAr != other.nameAr) return false;
    if (nameEn != other.nameEn) return false;
    return true;
  }

  @override
  String toString() {
    return '$nameAr,$nameEn';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceCode'] = code;
    map['serviceNameA'] = nameAr;
    map['serviceNameE'] = nameEn;
    if (contractings != null) {
      map['contractings'] = contractings?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
