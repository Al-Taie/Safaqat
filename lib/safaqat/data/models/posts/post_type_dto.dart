import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

part 'post_type_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PostTypeDto {
  @JsonKey(name: 'postType')
  int? type;
  @JsonKey(name: 'typeNameA')
  String? nameAr;
  @JsonKey(name: 'typeNameE')
  String? nameEn;

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';

  PostTypeDto({this.type, this.nameAr, this.nameEn});

  @override
  String toString(){
    return '$nameAr,$nameEn';
  }

   factory PostTypeDto.fromJson(Map<String, dynamic> json) => _$PostTypeDtoFromJson(json);

   Map<String, dynamic> toJson() => _$PostTypeDtoToJson(this);
}

