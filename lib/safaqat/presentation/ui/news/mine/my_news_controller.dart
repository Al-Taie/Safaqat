import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_query.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/domain/entities/news_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/news/delete_news_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/news/get_my_news_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/news/search_news_usecase.dart';

class MyNewsController extends GetxController {
  final GetMyNewsUseCase _getMyNewsUseCase = Get.put(GetMyNewsUseCase());
  final SearchNewsUseCase _searchNewsUseCase = Get.put(SearchNewsUseCase());
  final DeleteNewsUseCase _deleteNewsUseCase = Get.put(DeleteNewsUseCase());

  final acceptedScrollController = ScrollController();
  final waitedScrollController = ScrollController();
  final rejectedScrollController = ScrollController();
  

  @override
  void onInit() {
    super.onInit();

    acceptedScrollController.addListener(() => _pagination(
          apiCall: getApprovedNews,
          onValueChange: (int value) {
            acceptedPageNumber = value;
          },
          scrollController: acceptedScrollController,
          pageNumber: acceptedPageNumber,
          maxNumberOfPages: _acceptedMaxNumberOfPages,
        ));

    waitedScrollController.addListener(() {
          return _pagination(
            apiCall: getWaitedNews,
            onValueChange: (int value) {
              waitedPageNumber = value;
            },
            scrollController: waitedScrollController,
            pageNumber: waitedPageNumber,
            maxNumberOfPages: _waitedMaxNumberOfPages,
          );
        });

    rejectedScrollController.addListener(() => _pagination(
          apiCall: getRejectedNews,
          onValueChange: (int value) {
            rejectedPageNumber = value;
          },
          scrollController: rejectedScrollController,
          pageNumber: rejectedPageNumber,
          maxNumberOfPages: _rejectedMaxNumberOfPages,
        ));

    acceptedScrollController.addListener(
        () => _floatingButtonState(scrollController: acceptedScrollController));
    waitedScrollController.addListener(
        () => _floatingButtonState(scrollController: waitedScrollController));
    rejectedScrollController.addListener(
        () => _floatingButtonState(scrollController: rejectedScrollController));

    getApprovedNews();
    getWaitedNews();
    getRejectedNews();
  }

  final isFloatingButtonExtended = true.obs;

  var _acceptedMaxNumberOfPages = 1;
  var _waitedMaxNumberOfPages = 1;
  var _rejectedMaxNumberOfPages = 1;

  final _acceptedPageNumber = 1.obs;

  int get acceptedPageNumber => _acceptedPageNumber.value;

  set acceptedPageNumber(int value) => _acceptedPageNumber.value = value;

  final _waitedPageNumber = 1.obs;

  int get waitedPageNumber => _waitedPageNumber.value;

  set waitedPageNumber(int value) => _waitedPageNumber.value = value;

  final _rejectedPageNumber = 1.obs;

  int get rejectedPageNumber => _rejectedPageNumber.value;

  set rejectedPageNumber(int value) => _rejectedPageNumber.value = value;

  final _newsData = NewsDto().obs;
  NewsDto get newsData => _newsData.value;
  set newsData(NewsDto value) => _newsData.value = value;

  Rx<Resources<dynamic>> status = Resources<dynamic>.init().obs;
  Rx<Resources<NewsResponse>> acceptedStatus = Resources<NewsResponse>.init().obs;
  Rx<Resources<NewsResponse>> waitedStatus = Resources<NewsResponse>.init().obs;
  Rx<Resources<NewsResponse>> rejectedStatus = Resources<NewsResponse>.init().obs;

  RxList<NewsDto> acceptedNews = <NewsDto>[].obs;
  RxList<NewsDto> waitedNews = <NewsDto>[].obs;
  RxList<NewsDto> rejectedNews = <NewsDto>[].obs;

  final _query = ''.obs;

  String get query => _query.value;

  set query(String value) => _query.value = value;

  void getApprovedNews() async {
    final params = NewsQuery(
      pageNumber: acceptedPageNumber,
      type: NewsType.accepted.index,
    );

    acceptedStatus.value = Resources.loading();

    final result = await _getMyNewsUseCase(params: params);
    acceptedStatus.value = result;

    if(result.data?.news != null){
      acceptedNews.value = result.data!.news!;
    }

    _acceptedMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getWaitedNews() async {
    final params = NewsQuery(
      pageNumber: waitedPageNumber,
      type: NewsType.waited.index,
    );

    waitedStatus.value = Resources.loading();

    final result = await _getMyNewsUseCase(params: params);
    waitedStatus.value = result;

    if(result.data?.news != null){
      waitedNews.value = result.data!.news!;
    }

    _waitedMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getRejectedNews() async {
    final params = NewsQuery(
      pageNumber: rejectedPageNumber,
      type: NewsType.rejected.index,
    );

    rejectedStatus.value = Resources.loading();

    final result = await _getMyNewsUseCase(params: params);
    rejectedStatus.value = result;

    if(result.data?.news != null){
      rejectedNews.value = result.data!.news!;
    }

    _rejectedMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchNews() async {
    acceptedStatus.value = Resources.loading();

    final result = await _searchNewsUseCase(params: query);
    final data = NewsResponse(numberOfPages: 1, news: result.data);

    if (result.status == Status.success) {
      acceptedStatus.value = Resources.success(data, result.statusCode);
    } else if (result.status == Status.error) {
      acceptedStatus.value = Resources.error(result.error, result.statusCode);
    }
  }

  void _pagination({
    required VoidCallback apiCall,
    required ValueChanged<int> onValueChange,
    required ScrollController scrollController,
    required int pageNumber,
    required int maxNumberOfPages,
  }) {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < maxNumberOfPages)) {
      onValueChange(++pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      onValueChange(--pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    }
  }

  void _floatingButtonState({required ScrollController scrollController}) {
    if (scrollController.position.isMinScroll) {
      Logger.log(scrollController.position);
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void deleteNews({required NewsType type, String? id}) async {
    Get.back();
    status.value = Resources.loading();
    final result = await _deleteNewsUseCase(params: id);
    status.value = result;

    if (result.status != Status.success) {
      AppStrings.deletedFailed.toToast();
      return;
    }

    AppStrings.deletedSuccessfully.toToast();

    if (type == NewsType.accepted) {
      acceptedNews.removeWhere((it) => it.id == id);
    } else if (type == NewsType.rejected) {
      rejectedNews.removeWhere((it) => it.id == id);
    } else {
      waitedNews.removeWhere((it) => it.id == id);
    }

  }
}
