import 'dart:io';

import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/news/publish/publish_news_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';
import 'package:tuple/tuple.dart';

class AddNewsUseCase extends ParamUseCase<Resources, Tuple2<PublishNewsBody, List<File>>> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources> call({required Tuple2<PublishNewsBody, List<File>> params}) =>
      _safaqatRepository.addNews(body: params.item1, images: params.item2);
}
