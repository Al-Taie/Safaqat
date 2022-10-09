import 'package:get/get.dart';
import 'package:safaqat/safaqat/data/models/news/news_body.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/news/get_news_usecase.dart';

class HomeController extends GetxController {
  final GetNewsUseCase _getNewsUseCase = Get.find();

  @override
  void onInit() {
    super.onInit();
    getNews();
  }

  final _pageNumber = 1.obs;
  int get pageNumber => _pageNumber.value;
  set pageNumber(int value) => _pageNumber.value = value;

  final _newsData = NewsDto().obs;
  NewsDto get newsData  => _newsData .value;
  set newsData (NewsDto value) => _newsData.value = value;

  Rx<Resources<NewsResponse>> news =
      Resources<NewsResponse>.init().obs;

  void getNews() async {
    final body = NewsBody(
        pageNumber: pageNumber
    );

    news.value = Resources.loading();

    final result = await _getNewsUseCase(params: body);
    news.value = result;
  }
}
