import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/news/news_query.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetNewsUseCase extends ParamUseCase<Resources<NewsResponse>, NewsQuery> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<NewsResponse>> call({required NewsQuery params}) =>
      _safaqatRepository.getNews(
          pageSize: params.pageSize, pageNumber: params.pageNumber);
}
