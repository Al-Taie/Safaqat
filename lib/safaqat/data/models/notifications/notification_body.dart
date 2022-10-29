import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
part 'notification_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class NotificationBody {
@JsonKey(name: 'customerId')
  String customerId;

  @JsonKey(name: 'pageSize')
  int pageSize;

  @JsonKey(name: 'pageNumber')
  int pageNumber;

NotificationBody({this.pageSize = 10, required this.pageNumber, required this.customerId});

  factory NotificationBody.fromJson(Map<String, dynamic> json) =>
      _$NotificationBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationBodyToJson(this);
}
