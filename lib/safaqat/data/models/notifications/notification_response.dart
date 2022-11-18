import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_dto.dart';

part 'notification_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class NotificationsResponse {
  @JsonKey(name: 'numberOfPages')
  int? numberOfPages;
  @JsonKey(name: 'notification')
  List<NotificationDto>? notifications;

  NotificationsResponse({this.numberOfPages, this.notifications});

   factory NotificationsResponse.fromJson(Map<String, dynamic> json) => _$NotificationsResponseFromJson(json);

   Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}
