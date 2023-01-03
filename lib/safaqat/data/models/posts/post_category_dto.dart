import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

part 'post_category_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PostCategoryDto {
  @JsonKey(name: 'categoryCode')
  int? code;
  @JsonKey(name: 'categoryNameA')
  String? nameAr;
  @JsonKey(name: 'categoryNameE')
  String? nameEn;

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';

  PostCategoryDto({this.code, this.nameAr, this.nameEn});

  @override
  int get hashCode => code ?? 0;

  @override
  bool operator ==(Object other) {
    if (other is! PostCategoryDto) return false;
    if (code != other.code) return false;
    if (nameAr != other.nameAr) return false;
    if (nameEn != other.nameEn) return false;
    return true;
  }

  @override
  String toString() {
    return '$nameAr,$nameEn';
  }

  factory PostCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$PostCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostCategoryDtoToJson(this);
}
