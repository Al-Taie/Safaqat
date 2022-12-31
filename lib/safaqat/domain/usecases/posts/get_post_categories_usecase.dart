import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/no_param_usecase.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/posts_response.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetPostCategoriesUseCase
    extends NoParamUseCase<Resources<List<PostCategoryDto>>> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<List<PostCategoryDto>>> call() =>
      _safaqatRepository.getPostCategories();
}
