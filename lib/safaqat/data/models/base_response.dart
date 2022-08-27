import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseResponse<T> {
  T? result;

  BaseResponse({this.result});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
