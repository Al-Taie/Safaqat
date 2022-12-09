import 'dart:io';

import 'package:get/get.dart';
import 'package:safaqat/safaqat/data/models/events/publish_event_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/events/add_event_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_controller.dart';
import 'package:tuple/tuple.dart';

class AddEventController extends GetxController {
  final _addEventUseCase = Get.put(AddEventUseCase());
  final MyEventsController _myEventsController = Get.find();

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  final RxList<String> tagsAr = <String>[].obs;
  final RxList<String> tagsEn = <String>[].obs;

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

  void publish() async {
    status.value = Resources.loading();
    final PublishEventBody body = PublishEventBody(
      titleAr: titleAr,
      titleEn: titleEn,
      detailsAr: detailsAr,
      detailsEn: detailsEn,
      tagsAr: tagsAr,
      tagsEn: tagsEn,
      showName: showName,
    );

    final result = await _addEventUseCase(params: Tuple2(body, images));
    status.value = result;

    if (result.status == Status.success) {
      // _myEventsController.waitedEvents.add(result.data!);
    }
  }
}
