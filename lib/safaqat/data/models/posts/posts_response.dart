import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';

part 'posts_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PostsResponse {
  @JsonKey(name: 'numberOfPages')
  int? numberOfPages;
  @JsonKey(name: 'post')
  List<PostDto>? posts;

  PostsResponse({this.numberOfPages, this.posts});

  factory PostsResponse.fromJson(Map<String, dynamic> json) => _$PostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostsResponseToJson(this);
}
