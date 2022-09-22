import 'package:json_annotation/json_annotation.dart';

part 'publish_news_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PublishNewsBody {
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'newsTitleA')
  String? newsTitleA;
  @JsonKey(name: 'newsTitleE')
  String? newsTitleE;
  @JsonKey(name: 'newsDetailsA')
  String? newsDetailsA;
  @JsonKey(name: 'newsDetailsE')
  String? newsDetailsE;
  @JsonKey(name: 'showName')
  int? showName;
  @JsonKey(name: 'tagsA')
  String? tagsA;
  @JsonKey(name: 'tagsE')
  String? tagsE;
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
  @JsonKey(name: 'statusDesc')
  String? statusDesc;

  PublishNewsBody({
    this.username,
    this.newsTitleA,
    this.newsTitleE,
    this.newsDetailsA,
    this.newsDetailsE,
    this.showName,
    this.tagsA,
    this.tagsE,
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
    this.statusDesc,
  });

  factory PublishNewsBody.fromJson(Map<String, dynamic> json) =>
      _$PublishNewsBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PublishNewsBodyToJson(this);
}
