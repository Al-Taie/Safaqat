import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/news/news_query.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/logout/delete_user_info_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/news/get_news_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';

class NewsController extends GetxController {
  final DeleteUserInfoUseCase _logoutUseCase = Get.put(DeleteUserInfoUseCase());
  final GetNewsUseCase _getNewsUseCase = Get.put(GetNewsUseCase());
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

  Rx<Resources<NewsResponse>> status = Resources<NewsResponse>.init().obs;

  RxList<NewsDto> news = <NewsDto>[].obs;
  RxList<NewsDto> filteredNews = <NewsDto>[].obs;

  final _query = ''.obs;

  String get query => _query.value;

  set query(String value) => _query.value = value;

  void getNews() async {
    final body = NewsQuery(pageNumber: pageNumber);

    status.value = Resources.loading();

    final result = await _getNewsUseCase(params: body);
    status.value = result;

    if (result.data?.news != null) {
      news.value = result.data!.news!;
      filteredNews.value = news.value;
    }
    _maxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchNews(String query) {
    List<NewsDto> newFilteredData = news.value;

    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();

    filteredNews.value = newFilteredData;
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

  void logout() {
    _logoutUseCase();
    Get.offAll(() => const LoginPage());
  }
}
