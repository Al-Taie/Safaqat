import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/baseiInfo.dart';

part 'country_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CountryDto extends BaseInfo {
  @JsonKey(name: 'countryNo')
  int? countryNo;

  @override
  @JsonKey(name: 'countryNameA')
  String? nameAr;

  @override
  @JsonKey(name: 'countryNameE')
  String? nameEn;

  @JsonKey(name: 'countryCodeNavigation')
  List? codeNavigation;
  @JsonKey(name: 'customerNationalityCodeNavigations')
  List? customerNationalityCodeNavigations;

  CountryDto({
    this.countryNo,
    this.nameAr,
    this.nameEn,
    super.iso2,
    super.iso3,
    this.codeNavigation,
    this.customerNationalityCodeNavigations,
  });

  factory CountryDto.fromJson(Map<String, dynamic> json) =>
      _$CountryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDtoToJson(this);
}
