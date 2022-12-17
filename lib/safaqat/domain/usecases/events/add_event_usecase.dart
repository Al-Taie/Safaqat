
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/events/event_body.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class AddEventUseCase extends ParamUseCase<Resources<EventDto>, EventBody> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<EventDto>> call({required EventBody params}) =>
      _safaqatRepository.addEvent(body: params);
}
