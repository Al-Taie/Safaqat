import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_type.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/add/add_post_page.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/components/post_items_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/mine/my_posts_controller.dart';

class MyPostsPage extends StatelessWidget {
  const MyPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyPostsController());
    PostType type = PostType.opportunity;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 6,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: Obx(
              () => CustomFloatingButton(
                title: AppStrings.addNewPost,
                icon: AppDrawable.icAdd,
                isExtended: controller.isFloatingButtonExtended.value,
                onClick: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  const AddPostPage().navTo();
                },
              ),
            ),
            appBar: AppBarWidget(
              width: Get.width,
              onBackPressed: Get.back,
              title: AppStrings.managePosts,
              bottom: TabBar(
                isScrollable: true,
                labelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.shadePrimary,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.opportunity),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.request),
                  ),
                ],
                onTap: (index) {
                  if (index == PostType.opportunity.index) {
                    type = PostType.opportunity;
                  } else if (index == PostType.request.index) {
                    type = PostType.request;
                  }
                },
              ),
              onSearch: (String query) => controller.searchPosts(type, query),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                TabBarView(
                  children: [
                    Obx(
                      () => PostItemsWidget(
                        status: controller.opportunityStatus.value.status,
                        apiCall: controller.getOpportunityPosts,
                        scrollController:
                            controller.opportunityScrollController,
                        data: controller.filteredOpportunityPosts.value,
                        isLogged: true,
                        onEdit: (value) {
                          // TODO: IMPLEMENT ME
                          // EditPostPage(post: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deletePosts(
                              type: PostType.opportunity, id: value.id);
                        },
                        onPressed: (value) {
                          controller.postData = value;
                        },
                        onScrollUpPressed: () {
                          controller.opportunityPageNumber--;
                        },
                        scrollButtonVisibility:
                            controller.isOpportunityScrollable,
                      ),
                    ),
                    Obx(
                      () => PostItemsWidget(
                        status: controller.requestStatus.value.status,
                        apiCall: controller.getRequestPosts,
                        scrollController: controller.requestScrollController,
                        data: controller.filteredRequestPosts.value,
                        isLogged: true,
                        onEdit: (value) {
                          // TODO: IMPLEMENT ME
                          // EditPostPage(post: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deletePosts(
                              type: PostType.request, id: value.id);
                        },
                        onPressed: (value) {
                          controller.postData = value;
                        },
                        onScrollUpPressed: () {
                          controller.requestPageNumber--;
                        },
                        scrollButtonVisibility: controller.isRequestScrollable,
                      ),
                    ),
                  ],
                ),
                LoadingView(resource: controller.status.value)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
