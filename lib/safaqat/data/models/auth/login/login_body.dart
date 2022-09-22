import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class LoginBody {
  @JsonKey(name: 'userName')
  String? username;
  @JsonKey(name: 'password')
  String? password;

  LoginBody({
    this.username,
    this.password,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}
