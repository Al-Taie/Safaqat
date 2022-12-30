import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/posts_response.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/logout/delete_user_info_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/posts/get_posts_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';

class PostsController extends GetxController {
  final DeleteUserInfoUseCase _logoutUseCase = Get.put(DeleteUserInfoUseCase());
  final GetPostsUseCase _getPostsUseCase = Get.put(GetPostsUseCase());
  final scrollController = ScrollController();

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_pagination);
    scrollController.addListener(_floatingButtonState);
    getPosts();
  }

  final isFloatingButtonExtended = true.obs;

  final _pageNumber = 1.obs;
  var _maxNumberOfPages = 1;

  int get pageNumber => _pageNumber.value;

  set pageNumber(int value) => _pageNumber.value = value;

  final _postData = PostDto().obs;
  PostDto get postData => _postData.value;
  set postData(PostDto value) => _postData.value = value;

  Rx<Resources<PostsResponse>> status = Resources<PostsResponse>.init().obs;

  RxList<PostDto> posts = <PostDto>[].obs;
  RxList<PostDto> filteredPosts = <PostDto>[].obs;

  final _query = ''.obs;

  String get query => _query.value;

  set query(String value) => _query.value = value;

  void getPosts() async {
    final body = PostQuery(pageNumber: pageNumber);

    status.value = Resources.loading();

    final result = await _getPostsUseCase(params: body);
    status.value = result;

    if (result.data?.posts != null) {
      posts.value = result.data!.posts!;
      filteredPosts.value = posts.value;
    }
    _maxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchPosts(String query) {
    List<PostDto> newFilteredData = posts.value;

    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();

    filteredPosts.value = newFilteredData;
  }

  void _pagination() {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < _maxNumberOfPages)) {
      pageNumber++;
      isFloatingButtonExtended.value = true;
      getPosts();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      pageNumber--;
      isFloatingButtonExtended.value = true;
      getPosts();
    }
  }

  void _floatingButtonState() {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void logout() {
    _logoutUseCase();
    Get.offAll(() => const LoginPage());
  }
}
