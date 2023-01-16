import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_dto.dart';

part 'contract_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ContractResponse {
  @JsonKey(name: 'numberOfPages')
  int? numberOfPages;
  @JsonKey(name: 'post')
  List<ContractDto>? contracts;

  ContractResponse({this.numberOfPages, this.contracts});

  factory ContractResponse.fromJson(Map<String, dynamic> json) => _$ContractResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContractResponseToJson(this);
}
