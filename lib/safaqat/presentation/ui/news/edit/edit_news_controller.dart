import 'dart:io';

import 'package:get/get.dart';
import 'package:safaqat/safaqat/data/models/news/edit/edit_news_body.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/domain/entities/edit_news_params.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/news/edit_news_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/news/mine/my_news_controller.dart';

class EditNewsController extends GetxController {
  final _editNewsUseCase = Get.put(EditNewsUseCase());
  final MyNewsController _myNewsController = Get.find();

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  final RxList<String> tagsAr = <String>[].obs;
  final RxList<String> tagsEn = <String>[].obs;
  var news = NewsDto();

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
    final body = EditNewsParams(
        newsId: news.id,
        body: EditNewsBody(
          titleAr: titleAr,
          titleEn: titleEn,
          detailsAr: detailsAr,
          detailsEn: detailsEn,
          tagsAr: tagsAr,
          tagsEn: tagsEn,
          showName: showName,
        ));

    final result = await _editNewsUseCase(params: body);
    status.value = result;

    if (result.status == Status.success) {
      var index = _myNewsController.waitedNews.indexOf(news);
      _myNewsController.waitedNews.remove(news);
      _myNewsController.waitedNews.insert(index, result.data!);
    }
  }

  void loadNews(NewsDto? news) {
    if (news == null) return;

    titleAr = news.titleAr ?? '';
    titleEn = news.titleEn ?? '';
    detailsAr = news.detailsAr ?? '';
    detailsEn = news.detailsEn ?? '';
    tagsAr.value = news.tagsAr ?? [];
    tagsEn.value = news.tagsEn ?? [];
  }
}
