import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/int_extension.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/data/models/auth/register/register_body.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/news/publish_news_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/get_cities_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/get_countires_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/register_usecase.dart';
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
    );

    final result = await _addNewsUseCase(params: body);
    status.value = result;
  }
}
