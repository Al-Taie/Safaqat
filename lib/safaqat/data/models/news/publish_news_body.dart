import 'package:json_annotation/json_annotation.dart';

part 'publish_news_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PublishNewsBody {
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'newsTitleA')
  String? titleAr;
  @JsonKey(name: 'newsTitleE')
  String? titleEn;
  @JsonKey(name: 'newsDetailsA')
  String? detailsAr;
  @JsonKey(name: 'newsDetailsE')
  String? detailsEn;
  @JsonKey(name: 'showName')
  bool showName;
  @JsonKey(name: 'tagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'tagsE')
  List<String>? tagsEn;
  @JsonKey(name: 'images')
  List<String>? images;

  PublishNewsBody({
    this.username,
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.showName = false,
    this.tagsAr,
    this.tagsEn,
    this.images,
  });

  factory PublishNewsBody.fromJson(Map<String, dynamic> json) =>
      _$PublishNewsBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PublishNewsBodyToJson(this);
}
