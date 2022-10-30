import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class SearchNewsUseCase extends ParamUseCase<Resources<List<NewsDto>>, String> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<List<NewsDto>>> call({required String params}) =>
      _safaqatRepository.searchNews(query: params);
}
