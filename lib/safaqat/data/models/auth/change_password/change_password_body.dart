import 'package:json_annotation/json_annotation.dart';

part 'change_password_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ChangePasswordBody {
  @JsonKey(name: 'userName')
  String? username;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'newPassword')
  String? newPassword;

  ChangePasswordBody({
    this.username,
    this.password,
    this.newPassword,
  });

  factory ChangePasswordBody.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordBodyToJson(this);
}
