import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(ignoreUnannotated: false)
class EventQuery {
  @JsonKey(name: 'pageSize')
  int pageSize;

  @JsonKey(name: 'pageNumber')
  int pageNumber;

  int type;

  EventQuery({this.pageSize = 10, required this.pageNumber, this.type = 0});
}
