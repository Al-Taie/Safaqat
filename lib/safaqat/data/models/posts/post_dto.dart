import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';

part 'post_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PostDto {
  @JsonKey(name: 'postId')
  String? id;
  @JsonKey(name: 'ownerName')
  String? ownerName;
  @JsonKey(name: 'ownerTel')
  String? ownerTel;
  @JsonKey(name: 'ownerEmail')
  String? ownerEmail;
  @JsonKey(name: 'postTitleA')
  String? titleAr;
  @JsonKey(name: 'postTitleE')
  String? titleEn;
  @JsonKey(name: 'instituteNameA')
  String? instituteNameA;
  @JsonKey(name: 'instituteNameE')
  String? instituteNameE;
  @JsonKey(name: 'postType')
  bool? type;
  @JsonKey(name: 'typeNameA')
  String? typeNameAr;
  @JsonKey(name: 'typeNameE')
  String? typeNameEn;
  @JsonKey(name: 'categoryCode')
  int? categoryCode;
  @JsonKey(name: 'categoryNameA')
  String? categoryNameAr;
  @JsonKey(name: 'categoryNameE')
  String? categoryNameEn;
  @JsonKey(name: 'city')
  CityDto? city;
  @JsonKey(name: 'costCode')
  bool? costCode;
  @JsonKey(name: 'costValueE')
  String? costValueE;
  @JsonKey(name: 'costValueA')
  String? costValueA;
  @JsonKey(name: 'descriptionA')
  String? descriptionA;
  @JsonKey(name: 'descriptionE')
  String? descriptionE;
  @JsonKey(name: 'postStatus')
  int? postStatus;
  @JsonKey(name: 'statusDesc')
  String? statusDesc;
  @JsonKey(name: 'coordinates')
  CoordinatesDto? coordinates;
  @JsonKey(name: 'expiryDate')
  String? expiryDate;
  @JsonKey(name: 'showTel')
  bool? showTel;
  @JsonKey(name: 'showEmail')
  bool? showEmail;
  @JsonKey(name: 'postDate')
  String? postDate;
  @JsonKey(name: 'images')
  List<String>? images;

  PostDto({
    this.id,
    this.ownerName,
    this.ownerTel,
    this.ownerEmail,
    this.titleAr,
    this.titleEn,
    this.instituteNameA,
    this.instituteNameE,
    this.type,
    this.typeNameAr,
    this.typeNameEn,
    this.categoryCode,
    this.categoryNameAr,
    this.categoryNameEn,
    this.city,
    this.costCode,
    this.costValueE,
    this.costValueA,
    this.descriptionA,
    this.descriptionE,
    this.postStatus,
    this.statusDesc,
    this.coordinates,
    this.expiryDate,
    this.showTel,
    this.showEmail,
    this.postDate,
    this.images,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);
}
