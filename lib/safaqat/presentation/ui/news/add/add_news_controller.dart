import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:safaqat/safaqat/data/models/news/publish/publish_news_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/news/add_news_usecase.dart';

class AddNewsController extends GetxController {
  final _addNewsUseCase = Get.put(AddNewsUseCase());

  final Rx<Resources> status = Resources.init().obs;
  Iterable<Uint8List?> imagesBytes = <Uint8List?>[];
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
    List<String> images = [];

    for (var element in imagesBytes) {
        images.addIf(element != null, base64Encode(element!));
    }

    status.value = Resources.loading();
    final PublishNewsBody body = PublishNewsBody(
      titleAr: titleAr,
      titleEn: titleEn,
      detailsAr: detailsAr,
      detailsEn: detailsEn,
      images: images,
      tagsAr: tagsAr,
      tagsEn: tagsEn,
      showName: showName,
    );

    final result = await _addNewsUseCase(params: body);
    status.value = result;
  }
}
