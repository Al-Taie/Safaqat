import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/baseiInfo.dart';

part 'city_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CityDto extends BaseInfo {
  @JsonKey(name: 'cityNo')
  int? cityNo;

  @override
  @JsonKey(name: 'cityNameA')
  String? nameAr;

  @override
  @JsonKey(name: 'cityNameE')
  String? nameEn;

  @JsonKey(name: 'isoAlpha3')
  String? iso3;
  @JsonKey(name: 'countryCode')
  int? countryCode;
  @JsonKey(name: 'countryCodeNavigation')
  List? countryCodeNavigation;

  CityDto({this.cityNo, this.nameAr, this.nameEn, this.iso3, this.countryCode, this.countryCodeNavigation});

   factory CityDto.fromJson(Map<String, dynamic> json) => _$CityDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CityDtoToJson(this);
}

