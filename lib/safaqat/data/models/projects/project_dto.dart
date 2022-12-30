import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_convener_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_sector_dto.dart';

part 'project_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProjectDto {
  @JsonKey(name: 'projId')
  String? id;
  @JsonKey(name: 'ownerName')
  String? ownerName;
  @JsonKey(name: 'projNameA')
  String? nameAr;
  @JsonKey(name: 'projNameE')
  String? nameEn;
  @JsonKey(name: 'instituteNameA')
  String? instituteNameAr;
  @JsonKey(name: 'instituteNameE')
  String? instituteNameEn;
  @JsonKey(name: 'startDate')
  String? startDate;
  @JsonKey(name: 'endDate')
  String? endDate;
  @JsonKey(name: 'actualEndDate')
  String? actualEndDate;
  @JsonKey(name: 'convener')
  ProjectConvenerDto? convener;
  @JsonKey(name: 'sector')
  ProjectSectorDto? sector;
  @JsonKey(name: 'city')
  CityDto? city;
  @JsonKey(name: 'category')
  PostCategoryDto? category;
  @JsonKey(name: 'coordinates')
  CoordinatesDto? coordinates;
  @JsonKey(name: 'cost')
  int? cost;
  @JsonKey(name: 'descA')
  String? descriptionAr;
  @JsonKey(name: 'descE')
  String? descriptionEn;
  @JsonKey(name: 'postStatus')
  int? postStatus;
  @JsonKey(name: 'statusDesc')
  String? statusDesc;
  @JsonKey(name: 'telephone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'showTel')
  bool? showTel;
  @JsonKey(name: 'showEmail')
  bool? showEmail;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(name: 'postDate')
  String? postDate;

  String get name => (Utils.isRTL ? nameAr : nameEn) ?? '-';

  ProjectDto({
    this.id,
    this.ownerName,
    this.nameAr,
    this.nameEn,
    this.instituteNameAr,
    this.instituteNameEn,
    this.startDate,
    this.endDate,
    this.actualEndDate,
    this.convener,
    this.sector,
    this.city,
    this.category,
    this.coordinates,
    this.cost,
    this.descriptionAr,
    this.descriptionEn,
    this.postStatus,
    this.statusDesc,
    this.phone,
    this.email,
    this.showTel,
    this.showEmail,
    this.images,
    this.postDate,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);
}
