import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

part 'post_cost_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PostCostDto {
  @JsonKey(name: 'costCode')
  int? code;
  @JsonKey(name: 'costValueE')
  String? valueEn;
  @JsonKey(name: 'costValueA')
  String? valueAr;

  PostCostDto({this.code, this.valueEn, this.valueAr});

  String get value => (Utils.isRTL ? valueAr : valueEn) ?? '-';

   factory PostCostDto.fromJson(Map<String, dynamic> json) => _$PostCostDtoFromJson(json);

   Map<String, dynamic> toJson() => _$PostCostDtoToJson(this);
}

