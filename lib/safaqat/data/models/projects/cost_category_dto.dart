import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

part 'cost_category_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CostCategoryDto {
  @JsonKey(name: 'costCode')
  int? code;
  @JsonKey(name: 'costValueA')
  String? valueAr;
  @JsonKey(name: 'costValueE')
  String? valueEn;

  String get name => (Utils.isRTL ? valueAr : valueEn) ?? '-';

  CostCategoryDto({this.code, this.valueAr, this.valueEn});

  @override
  String toString(){
    return '$valueAr,$valueEn';
  }

   factory CostCategoryDto.fromJson(Map<String, dynamic> json) => _$CostCategoryDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CostCategoryDtoToJson(this);
}

