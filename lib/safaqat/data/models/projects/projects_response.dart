import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';

part 'projects_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ProjectsResponse {
  @JsonKey(name: 'numberOfPages')
  int? numberOfPages;
  @JsonKey(name: 'project')
  List<ProjectDto>? projects;

  ProjectsResponse({this.numberOfPages, this.projects});

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) => _$ProjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsResponseToJson(this);
}
