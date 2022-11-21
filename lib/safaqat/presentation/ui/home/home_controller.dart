import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/news/news_query.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/news/get_news_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/news/search_news_usecase.dart';

class HomeController extends GetxController {
  final GetNewsUseCase _getNewsUseCase = Get.put(GetNewsUseCase());
  final SearchNewsUseCase _searchNewsUseCase = Get.put(SearchNewsUseCase());
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_pagination);
    scrollController.addListener(_floatingButtonState);
    getNews();
  }

  final isFloatingButtonExtended = true.obs;

  final _pageNumber = 1.obs;
  var _maxNumberOfPages = 1;

  int get pageNumber => _pageNumber.value;

  set pageNumber(int value) => _pageNumber.value = value;

  final _newsData = NewsDto().obs;

  NewsDto get newsData => _newsData.value;

  set newsData(NewsDto value) => _newsData.value = value;

  Rx<Resources<NewsResponse>> news = Resources<NewsResponse>.init().obs;

  final _query = ''.obs;

  String get query => _query.value;

  set query(String value) => _query.value = value;

  void getNews() async {
    final body = NewsQuery(pageNumber: pageNumber);

    news.value = Resources.loading();

    final result = await _getNewsUseCase(params: body);
    news.value = result;
    _maxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchNews() async {
    news.value = Resources.loading();

    final result = await _searchNewsUseCase(params: query);
    final data = NewsResponse(numberOfPages: 1, news: result.data);

    if (result.status == Status.success) {
      news.value = Resources.success(data, result.statusCode);
    } else if (result.status == Status.error) {
      news.value = Resources.error(result.error, result.statusCode);
    }
  }

  void _pagination() {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < _maxNumberOfPages)) {
      pageNumber++;
      isFloatingButtonExtended.value = true;
      getNews();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      pageNumber--;
      isFloatingButtonExtended.value = true;
      getNews();
    }
  }

  void _floatingButtonState() {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }
}
