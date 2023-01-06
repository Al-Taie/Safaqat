import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

part 'project_sector_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProjectSectorDto {
  @JsonKey(name: 'nameA')
  String? nameAr;
  @JsonKey(name: 'nameE')
  String? nameEn;
  @JsonKey(name: 'code')
  int? code;

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';
  ProjectSectorDto({this.nameAr, this.nameEn, this.code});

  @override
  String toString(){
    return '$nameAr,$nameEn';
  }

  factory ProjectSectorDto.fromJson(Map<String, dynamic> json) => _$ProjectSectorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectSectorDtoToJson(this);
}

