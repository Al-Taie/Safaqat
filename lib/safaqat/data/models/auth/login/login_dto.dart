import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class LoginDto {

  @JsonKey(name: 'token')
  String? token;

  LoginDto({
    this.token,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}
