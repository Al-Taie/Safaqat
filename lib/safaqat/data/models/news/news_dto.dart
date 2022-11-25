import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class NewsDto {
  @JsonKey(name: 'newsId')
  String? id;
  @JsonKey(name: 'newsTitleA')
  String? titleAr;
  @JsonKey(name: 'newsTitleE')
  String? titleEn;
  @JsonKey(name: 'newsDetailsA')
  String? detailsAr;
  @JsonKey(name: 'newsDetailsE')
  String? detailsEn;
  @JsonKey(name: 'postDate')
  String? date;
  @JsonKey(name: 'showName')
  bool showName;
  @JsonKey(name: 'tagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'tagsE')
  List<String>? tagsEn;
  @JsonKey(name: 'images')
  List<String>? images;
  @JsonKey(name: 'newsStatus')
  int? status;
  @JsonKey(name: 'statusDesc')
  String? statusDescription;
  @JsonKey(name: 'ownerName')
  String? ownerName;

  NewsDto({
    this.id,
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.date,
    this.showName = false,
    this.tagsAr,
    this.tagsEn,
    this.images,
    this.status,
    this.statusDescription,
    this.ownerName,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDtoToJson(this);

  @override
  String toString() {
    return 'NewsDto(id=$id, titleAr=$titleAr, titleEn=$titleEn, detailsAr=$detailsAr, detailsEn=$detailsEn, tagsAr=$tagsAr, tagsEn=$tagsEn)';
  }
}
