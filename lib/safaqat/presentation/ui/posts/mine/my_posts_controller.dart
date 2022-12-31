import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/posts_response.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_query.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/posts/delete_post_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/posts/get_my_posts_usecase.dart';

class MyPostsController extends GetxController {
  final GetMyPostsUseCase _getMyPostsUseCase = Get.put(GetMyPostsUseCase());
  final DeletePostUseCase _deletePostUseCase = Get.put(DeletePostUseCase());

  final opportunityScrollController = ScrollController();
  final requestScrollController = ScrollController();

  final _isOpportunityScrollable = false.obs;

  bool get isOpportunityScrollable => _isOpportunityScrollable.value;

  set isOpportunityScrollable(bool value) =>
      _isOpportunityScrollable.value = value;

  final _isRequestScrollable = false.obs;

  bool get isRequestScrollable => _isRequestScrollable.value;

  set isRequestScrollable(bool value) => _isRequestScrollable.value = value;

  @override
  void onInit() {
    super.onInit();

    opportunityScrollController.addListener(() => _pagination(
          apiCall: getOpportunityPosts,
          onValueChange: (int value) {
            opportunityPageNumber = value;
          },
          scrollController: opportunityScrollController,
          pageNumber: opportunityPageNumber,
          maxNumberOfPages: _opportunityMaxNumberOfPages,
        ));

    requestScrollController.addListener(() => _pagination(
          apiCall: getRequestPosts,
          onValueChange: (int value) {
            requestPageNumber = value;
          },
          scrollController: requestScrollController,
          pageNumber: requestPageNumber,
          maxNumberOfPages: _requestMaxNumberOfPages,
        ));

    opportunityScrollController.addListener(() =>
        _floatingButtonState(scrollController: opportunityScrollController));

    requestScrollController.addListener(
        () => _floatingButtonState(scrollController: requestScrollController));

    getOpportunityPosts();
    getRequestPosts();
  }

  final isFloatingButtonExtended = true.obs;

  var _opportunityMaxNumberOfPages = 1;
  var _requestMaxNumberOfPages = 1;

  final _opportunityPageNumber = 1.obs;

  int get opportunityPageNumber => _opportunityPageNumber.value;

  set opportunityPageNumber(int value) => _opportunityPageNumber.value = value;

  final _requestPageNumber = 1.obs;

  int get requestPageNumber => _requestPageNumber.value;

  set requestPageNumber(int value) => _requestPageNumber.value = value;

  final _postData = PostDto().obs;

  PostDto get postData => _postData.value;

  set postData(PostDto value) => _postData.value = value;

  Rx<Resources<dynamic>> status = Resources<dynamic>.init().obs;

  Rx<Resources<PostsResponse>> opportunityStatus =
      Resources<PostsResponse>.init().obs;
  Rx<Resources<PostsResponse>> requestStatus =
      Resources<PostsResponse>.init().obs;

  RxList<PostDto> opportunityPosts = <PostDto>[].obs;
  RxList<PostDto> filteredOpportunityPosts = <PostDto>[].obs;
  RxList<PostDto> requestPosts = <PostDto>[].obs;
  RxList<PostDto> filteredRequestPosts = <PostDto>[].obs;

  void getOpportunityPosts() async {
    final params = PostQuery(
      pageNumber: opportunityPageNumber,
      type: PostType.opportunity.index,
    );

    opportunityStatus.value = Resources.loading();

    final result = await _getMyPostsUseCase(params: params);
    opportunityStatus.value = result;

    if (result.data?.posts != null) {
      opportunityPosts.value = result.data!.posts!;
      filteredOpportunityPosts.value = opportunityPosts.value;
    }

    _opportunityMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getRequestPosts() async {
    final params = PostQuery(
      pageNumber: requestPageNumber,
      type: PostType.request.index,
    );

    requestStatus.value = Resources.loading();

    final result = await _getMyPostsUseCase(params: params);
    requestStatus.value = result;

    if (result.data?.posts != null) {
      requestPosts.value = result.data!.posts!;
      filteredRequestPosts.value = requestPosts.value;
    }

    _requestMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchPosts(PostType type, String query) {
    var newFilteredData = <PostDto>[];

    if (type == PostType.opportunity) {
      newFilteredData = opportunityPosts;
    } else if (type == PostType.request) {
      newFilteredData = requestPosts;
    }

    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();

    if (type == PostType.opportunity) {
      filteredOpportunityPosts.value = newFilteredData;
    } else if (type == PostType.request) {
      filteredRequestPosts.value = newFilteredData;
    }
  }

  void _pagination({
    required VoidCallback apiCall,
    required ValueChanged<int> onValueChange,
    required ScrollController scrollController,
    required int pageNumber,
    required int maxNumberOfPages,
  }) {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < maxNumberOfPages)) {
      onValueChange(++pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      onValueChange(--pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    }
  }

  void _floatingButtonState({required ScrollController scrollController}) {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void deletePosts({required PostType type, String? id}) async {
    Get.back();
    status.value = Resources.loading();
    final result = await _deletePostUseCase(params: id);
    status.value = result;

    if (result.status != Status.success) {
      AppStrings.deletedFailed.toToast();
      return;
    }

    AppStrings.deletedSuccessfully.toToast();

    if (type == PostType.opportunity) {
      opportunityPosts.removeWhere((it) => it.id == id);
    } else if (type == PostType.request) {
      requestPosts.removeWhere((it) => it.id == id);
    }
  }
}
