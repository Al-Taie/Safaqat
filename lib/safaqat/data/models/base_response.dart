import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'is_success')
  bool isSuccess;

  @JsonKey(name: 'data')
  T? response;

  BaseResponse({
    this.response,
    this.isSuccess = false,
    this.message,
  });

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
