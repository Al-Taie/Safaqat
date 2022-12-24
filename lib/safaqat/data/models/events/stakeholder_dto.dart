import 'package:json_annotation/json_annotation.dart';

part 'stakeholder_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class StakeholderDto {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'order')
  int? order;
  @JsonKey(name: 'type')
  int? type;
  @JsonKey(name: 'sponsorType')
  String? sponsorType;
  @JsonKey(name: 'logo')
  String? logo;

  StakeholderDto(
      {this.name, this.order, this.type, this.sponsorType, this.logo});

  factory StakeholderDto.fromJson(Map<String, dynamic> json) =>
      _$StakeholderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StakeholderDtoToJson(this);
}
