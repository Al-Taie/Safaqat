import 'package:json_annotation/json_annotation.dart';

part 'stake_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class Stakeholder {
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

  Stakeholder({this.name, this.order, this.type, this.sponsorType, this.logo});

  factory Stakeholder.fromJson(Map<String, dynamic> json) => _$StakeholderFromJson(json);

  Map<String, dynamic> toJson() => _$StakeholderToJson(this);
}

