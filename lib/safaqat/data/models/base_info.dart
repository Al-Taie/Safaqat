import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

abstract class BaseInfo {
  String? nameAr;
  String? nameEn;

  @JsonKey(name: 'isoAlpha2')
  String? iso2;
  @JsonKey(name: 'isoAlpha3')
  String? iso3;

  BaseInfo({this.iso2, this.iso3});

  String get name => (Utils.isRTL ? nameAr : nameEn).toString();

  @override
  String toString() {
    return '$nameAr$nameEn$iso2$iso3'.toLowerCase();
  }
}
