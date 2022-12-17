

import 'package:safaqat/safaqat/data/models/events/event_body.dart';

class EditEventParams {
  EditEventParams({
    required this.eventId,
    required this.body,
  });

  final String? eventId;
  final EventBody body;
}
