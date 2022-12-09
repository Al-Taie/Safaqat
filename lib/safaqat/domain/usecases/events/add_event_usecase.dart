import 'dart:io';

import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/events/publish_event_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';
import 'package:tuple/tuple.dart';

class AddEventUseCase extends ParamUseCase<Resources<EventDto>, Tuple2<PublishEventBody, List<File>>> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<EventDto>> call({required Tuple2<PublishEventBody, List<File>> params}) =>
      _safaqatRepository.addEvent(body: params.item1, images: params.item2);
}
