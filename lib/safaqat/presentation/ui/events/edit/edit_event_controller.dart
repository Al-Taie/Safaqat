import 'dart:io';

import 'package:get/get.dart';
import 'package:safaqat/safaqat/data/models/events/edit_event_body.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/domain/entities/events/edit_event_params.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/events/edit_event_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_controller.dart';


class EditEventController extends GetxController {
  final _editEventUseCase = Get.put(EditEventUseCase());
  final MyEventsController _myEventsController = Get.find();

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  final RxList<String> tagsAr = <String>[].obs;
  final RxList<String> tagsEn = <String>[].obs;
  var event = EventDto();

  final _titleAr = ''.obs;
  String get titleAr => _titleAr.value;
  set titleAr(String value) => _titleAr.value = value;

  final _titleEn = ''.obs;
  String get titleEn => _titleEn.value;
  set titleEn(String value) => _titleEn.value = value;

  final _detailsAr = ''.obs;
  String get detailsAr => _detailsAr.value;
  set detailsAr(String value) => _detailsAr.value = value;

  final _detailsEn = ''.obs;
  String get detailsEn => _detailsEn.value;
  set detailsEn(String value) => _detailsEn.value = value;

  final _showName = false.obs;
  bool get showName => _showName.value;
  set showName(bool value) => _showName.value = value;

  void edit() async {
    status.value = Resources.loading();
    final body = EditEventParams(
        eventId: event.id,
        body: EditEventBody(
          titleAr: titleAr,
          titleEn: titleEn,
          detailsAr: detailsAr,
          detailsEn: detailsEn,
          tagsAr: tagsAr,
          tagsEn: tagsEn,
          showName: showName,
        ));

    final result = await _editEventUseCase(params: body);
    status.value = result;

    if (result.status == Status.success) {
    //   var index = _myEventsController.waitedEvents.indexOf(event);
    //   _myEventsController.waitedEvents.remove(event);
    //   _myEventsController.waitedEvents.insert(index, result.data!);
    }
  }

  void loadEvents(EventDto? event) {
    if (event == null) return;

    titleAr = event.titleAr ?? '';
    titleEn = event.titleEn ?? '';
    detailsAr = event.detailsAr ?? '';
    detailsEn = event.detailsEn ?? '';
    tagsAr.value = event.tagsAr ?? [];
    tagsEn.value = event.tagsEn ?? [];
  }
}
