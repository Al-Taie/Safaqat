import 'dart:io';

import 'package:get/get.dart';
import 'package:safaqat/safaqat/data/models/news/publish/publish_news_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/news/add_news_usecase.dart';
import 'package:tuple/tuple.dart';

class AddNewsController extends GetxController {
  final _addNewsUseCase = Get.put(AddNewsUseCase());

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
    final PublishNewsBody body = PublishNewsBody(
      username: 'ahmadmonis',
      titleAr: titleAr,
      titleEn: titleEn,
      detailsAr: detailsAr,
      detailsEn: detailsEn,
      tagsAr: tagsAr,
      tagsEn: tagsEn,
      showName: showName,
    );

    final result = await _addNewsUseCase(params: Tuple2(body, images));
    status.value = result;
  }
}
