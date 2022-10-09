import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
part 'news_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class NewsBody {
  @JsonKey(name: 'pageSize')
  int pageSize;

  @JsonKey(name: 'pageNumber')
  int pageNumber;

  NewsBody({this.pageSize = Utils.maxInt32Value, required this.pageNumber});

  factory NewsBody.fromJson(Map<String, dynamic> json) =>
      _$NewsBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NewsBodyToJson(this);
}
