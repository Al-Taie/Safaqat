import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/events/events_response.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetMyEventsUseCase extends ParamUseCase<Resources<EventsResponse>, EventQuery> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<EventsResponse>> call({required EventQuery params}) =>
      _safaqatRepository.getMyEvents(
        pageSize: params.pageSize,
        pageNumber: params.pageNumber,
        type: params.type
      );
}
