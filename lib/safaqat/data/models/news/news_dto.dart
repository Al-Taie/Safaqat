import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class News {
  @JsonKey(name: 'newsId')
  String? id;
  @JsonKey(name: 'newsOwnerId')
  String? ownerId;
  @JsonKey(name: 'newsTitleA')
  String? titleAr;
  @JsonKey(name: 'newsTitleE')
  String? titleEn;
  @JsonKey(name: 'newsDetailsA')
  String? detailsAr;
  @JsonKey(name: 'newsDetailsE')
  String? detailsEn;
  @JsonKey(name: 'newsDate')
  String? date;
  @JsonKey(name: 'showName')
  int? showName;
  @JsonKey(name: 'tagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'tagsE')
  List<String>? tagsEn;
  @JsonKey(name: 'image1')
  String? image1;
  @JsonKey(name: 'image2')
  String? image2;
  @JsonKey(name: 'image3')
  String? image3;
  @JsonKey(name: 'image4')
  String? image4;
  @JsonKey(name: 'image5')
  String? image5;
  @JsonKey(name: 'image6')
  String? image6;
  @JsonKey(name: 'image7')
  String? image7;
  @JsonKey(name: 'image8')
  String? image8;
  @JsonKey(name: 'image9')
  String? image9;
  @JsonKey(name: 'image10')
  String? image10;
  @JsonKey(name: 'newsStatus')
  int? status;
  @JsonKey(name: 'statusDesc')
  String? statusDesc;
  @JsonKey(name: 'newsOwner')
  String? ownerName;

  News({
    this.id,
    this.ownerId,
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.date,
    this.showName,
    this.tagsAr,
    this.tagsEn,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.image6,
    this.image7,
    this.image8,
    this.image9,
    this.image10,
    this.status,
    this.statusDesc,
    this.ownerName,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
