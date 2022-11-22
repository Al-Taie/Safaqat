import 'package:json_annotation/json_annotation.dart';
part 'publish_news_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PublishNewsBody {
  @JsonKey(name: 'NewsTitleA')
  String? titleAr;
  @JsonKey(name: 'NewsTitleE')
  String? titleEn;
  @JsonKey(name: 'NewsDetailsA')
  String? detailsAr;
  @JsonKey(name: 'NewsDetailsE')
  String? detailsEn;
  @JsonKey(name: 'ShowName')
  bool showName;
  @JsonKey(name: 'TagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'TagsE')
  List<String>? tagsEn;

  PublishNewsBody({
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.showName = false,
    this.tagsAr,
    this.tagsEn,
  });

  factory PublishNewsBody.fromJson(Map<String, dynamic> json) =>
      _$PublishNewsBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PublishNewsBodyToJson(this);
}
