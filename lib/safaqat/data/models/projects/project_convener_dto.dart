import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

part 'project_convener_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProjectConvenerDto {
  @JsonKey(name: 'nameA')
  String? nameAr;
  @JsonKey(name: 'nameE')
  String? nameEn;
  @JsonKey(name: 'code')
  int? code;

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';
  ProjectConvenerDto({this.nameAr, this.nameEn, this.code});

  @override
  String toString(){
    return '$nameAr,$nameEn';
  }

  factory ProjectConvenerDto.fromJson(Map<String, dynamic> json) => _$ProjectConvenerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectConvenerDtoToJson(this);
}

