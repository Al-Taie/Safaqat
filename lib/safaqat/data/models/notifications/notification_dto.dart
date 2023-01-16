import 'package:json_annotation/json_annotation.dart';
import 'package:safaqat/safaqat/domain/entities/notification_type.dart';

part 'notification_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class NotificationDto {
  @JsonKey(name: 'nNo')
  int? id;
  @JsonKey(name: 'customer_name')
  String? customerName;
  @JsonKey(name: 'date_time')
  String? date;
  @JsonKey(name: 'type')
  int? type;
  @JsonKey(name: 'text')
  String? description;
  @JsonKey(name: 'state')
  int? state;

  bool get isRead => state != 0;
  bool get isIncoming => type == NotificationType.incoming.index;

  NotificationDto({
    this.id,
    this.customerName,
    this.date,
    this.type,
    this.description,
    this.state,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);
}
