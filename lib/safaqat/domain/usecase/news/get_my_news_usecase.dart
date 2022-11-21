import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/app/extensions/shared_preferences.dart';
import 'package:safaqat/safaqat/data/models/news/news_query.dart';
import 'package:safaqat/safaqat/data/models/news/news_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetMyNewsUseCase extends ParamUseCase<Resources<NewsResponse>, NewsQuery> {
  final SafaqatRepository _safaqatRepository = Get.find();
  final SharedPreferences _preferences = Get.find();

  @override
  Future<Resources<NewsResponse>> call({required NewsQuery params}) =>
      _safaqatRepository.getMyNews(
        pageSize: params.pageSize,
        pageNumber: params.pageNumber,
        type: params.type,
        token: 'bearer ${_preferences.token}',
      );
}
