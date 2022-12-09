import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/domain/entities/events/edit_event_params.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class EditEventUseCase extends ParamUseCase<Resources<EventDto>, EditEventParams> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<EventDto>> call({required EditEventParams params}) =>
      _safaqatRepository.editEvent(
        eventId: params.eventId,
        body: params.body,
      );
}
