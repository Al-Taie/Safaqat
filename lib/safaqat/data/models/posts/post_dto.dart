import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_cost_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_type_dto.dart';

part 'post_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PostDto {
  @JsonKey(name: 'postId')
  String? id;
  @JsonKey(name: 'ownerName')
  String? ownerName;
  @JsonKey(name: 'ownerTel')
  String? ownerPhone;
  @JsonKey(name: 'ownerEmail')
  String? ownerEmail;
  @JsonKey(name: 'postTitleA')
  String? titleAr;
  @JsonKey(name: 'postTitleE')
  String? titleEn;
  @JsonKey(name: 'instituteNameA')
  String? instituteNameAr;
  @JsonKey(name: 'instituteNameE')
  String? instituteNameEn;
  @JsonKey(name: 'postType')
  PostTypeDto? type;
  @JsonKey(name: 'category')
  PostCategoryDto? category;
  @JsonKey(name: 'city')
  CityDto? city;
  @JsonKey(name: 'country')
  CountryDto? country;
  @JsonKey(name: 'cost')
  PostCostDto? cost;
  @JsonKey(name: 'descriptionA')
  String? descriptionAr;
  @JsonKey(name: 'descriptionE')
  String? descriptionEn;
  @JsonKey(name: 'postStatus')
  int? postStatus;
  @JsonKey(name: 'statusDesc')
  String? statusDesc;
  @JsonKey(name: 'coordinates')
  CoordinatesDto? coordinates;
  @JsonKey(name: 'expiryDate')
  String? expiryDate;
  @JsonKey(name: 'showTel')
  bool? showPhone;
  @JsonKey(name: 'showEmail')
  bool? showEmail;
  @JsonKey(name: 'postDate')
  String? postDate;
  @JsonKey(name: 'images')
  List<String>? images;

  PostDto({
    this.id,
    this.ownerName,
    this.ownerPhone,
    this.ownerEmail,
    this.titleAr,
    this.titleEn,
    this.instituteNameAr,
    this.instituteNameEn,
    this.type,
    this.category,
    this.city,
    this.cost,
    this.descriptionAr,
    this.descriptionEn,
    this.postStatus,
    this.statusDesc,
    this.coordinates,
    this.expiryDate,
    this.showPhone,
    this.showEmail,
    this.postDate,
    this.images,
  });

  String get description => (Utils.isRTL ? descriptionAr : descriptionEn) ?? '-';
  String get instituteName => (Utils.isRTL ? instituteNameAr : instituteNameEn) ?? '-';

  @override
  String toString(){
    return '$type,$category,'
        '$descriptionAr,$descriptionEn,$instituteNameAr,$instituteNameEn,'
        '$titleAr,$titleEn,$ownerName,$ownerEmail,$ownerPhone,$city';
  }

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);
}
