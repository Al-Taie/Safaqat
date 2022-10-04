import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_body.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetNewsUseCase extends ParamUseCase<Resources<NewsResponse>, NewsBody> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<NewsResponse>> call({required NewsBody params}) =>
      _safaqatRepository.getNews(
        pageSize: params.pageSize,
          pageNumber: params.pageNumber
      );
}
