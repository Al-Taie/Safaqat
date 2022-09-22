import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/customer/customer_dto.dart';

part 'customer_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CustomerResponse {
  @JsonKey(name: 'pageNumber')
  int? pageNumber;
  @JsonKey(name: 'customers')
  List<CustomerDto>? customers;

  CustomerResponse({
    this.pageNumber,
    this.customers,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}
