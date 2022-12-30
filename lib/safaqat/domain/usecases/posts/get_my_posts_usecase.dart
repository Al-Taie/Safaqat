import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/posts/posts_response.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetMyPostsUseCase
    extends ParamUseCase<Resources<PostsResponse>, PostQuery> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<PostsResponse>> call({required PostQuery params}) =>
      _safaqatRepository.getMyPosts(
        pageSize: params.pageSize,
        pageNumber: params.pageNumber,
        type: params.type,
      );
}
