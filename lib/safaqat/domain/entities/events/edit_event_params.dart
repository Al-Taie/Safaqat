import 'package:safaqat/safaqat/data/models/events/edit_event_body.dart';


class EditEventParams {
  EditEventParams({
    required this.eventId,
    required this.body,
  });

  final String? eventId;
  final EditEventBody body;
}
