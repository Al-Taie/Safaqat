import 'package:json_annotation/json_annotation.dart';
part 'news_query.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class NewsQuery {
  @JsonKey(name: 'pageSize')
  int pageSize;

  @JsonKey(name: 'pageNumber')
  int pageNumber;

  int type;

  NewsQuery({this.pageSize = 10, required this.pageNumber, this.type = 0});

  factory NewsQuery.fromJson(Map<String, dynamic> json) =>
      _$NewsQueryFromJson(json);

  Map<String, dynamic> toJson() => _$NewsQueryToJson(this);
}
