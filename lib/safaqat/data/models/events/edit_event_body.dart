import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(ignoreUnannotated: false)
class EditEventBody {

  @JsonKey(name: 'eventTitleA')
  String? titleAr;
  @JsonKey(name: 'eventTitleE')
  String? titleEn;
  @JsonKey(name: 'eventDetailsA')
  String? detailsAr;
  @JsonKey(name: 'eventDetailsE')
  String? detailsEn;
  @JsonKey(name: 'showName')
  bool showName;
  @JsonKey(name: 'tagsA')
  List<String>? tagsAr;
  @JsonKey(name: 'tagsE')
  List<String>? tagsEn;

  EditEventBody({
    this.titleAr,
    this.titleEn,
    this.detailsAr,
    this.detailsEn,
    this.showName = false,
    this.tagsAr,
    this.tagsEn,
  });
}
