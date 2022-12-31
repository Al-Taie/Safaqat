import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

part 'project_convener_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProjectConvenerDto {
  @JsonKey(name: 'nameA')
  String? nameAr;
  @JsonKey(name: 'nameE')
  String? nameEn;
  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';
  ProjectConvenerDto({this.nameAr, this.nameEn});

  @override
  String toString(){
    return '$nameAr,$nameEn';
  }

  factory ProjectConvenerDto.fromJson(Map<String, dynamic> json) => _$ProjectConvenerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectConvenerDtoToJson(this);
}

