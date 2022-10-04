import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';

part 'news_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class NewsResponse {
  @JsonKey(name: 'numberOfPages')
  int? numberOfPages;
  @JsonKey(name: 'news')
  List<News>? news;

  NewsResponse({this.numberOfPages, this.news});

   factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

   Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
