import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(ignoreUnannotated: false)
class PublishEventBody {
  @JsonKey(name: 'EventTitleA')
  String? titleAr;
  @JsonKey(name: 'EventTitleE')
  String? titleEn;
  @JsonKey(name: 'EventDetailsA')
  String? detailsAr;
  @JsonKey(name: 'EventDetailsE')
  String? detailsEn;
  @JsonKey(name: 'ShowName')
  bool showName;
  @JsonKey(name: 'TagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'TagsE')
  List<String>? tagsEn;

  PublishEventBody({
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.showName = false,
    this.tagsAr,
    this.tagsEn,
  });
}
