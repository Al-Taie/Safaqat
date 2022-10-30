import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/domain/entities/edit_news_params.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class EditNewsUseCase extends ParamUseCase<Resources, EditNewsParams> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources> call({required EditNewsParams params}) =>
      _safaqatRepository.editNews(
        newsId: params.newsId,
        body: params.body,
      );
}
