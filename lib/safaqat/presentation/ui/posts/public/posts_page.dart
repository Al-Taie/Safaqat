import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/app_drawer.dart';
import 'package:safaqat/safaqat/presentation/ui/news/mine/my_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/components/post_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/public/posts_controller.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key, this.logged = false}) : super(key: key);

  final bool logged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostsController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          drawer: logged
              ? AppDrawer(
                  name: 'Full Name',
                  imageUrl:
                      'https://st2.depositphotos.com/1006318/5909/v/600/depositphotos_59095205-stock-illustration-businessman-profile-icon.jpg',
                  onManageNews: const MyNewsPage().navTo,
                  onManageEvents: const MyEventsPage().navTo,
                  onLogout: controller.logout,
                )
              : null,
          appBar: AppBarWidget(
            width: Get.width,
            isSearchEnabled: true,
            // title: AppStrings.posts,
            onSearch: (String query) => controller.searchPosts(query),
          ),
          body: Obx(() {
            return StatusWidget(
              status: controller.status.value.status,
              onClickTryAgain: controller.getPosts,
              child: ListView.builder(
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    8,
                    16,
                    16,
                  ),
                  itemCount: controller.filteredPosts.length,
                  itemBuilder: (context, index) {
                    var item = controller.filteredPosts[index];
                    return PostCardWidget(
                      title: (Utils.isRTL ? item.titleAr : item.titleEn) ?? '-',
                      name: item.ownerName ?? '-',
                      image: item.images.firstOrNull ?? '',
                      date: Utils.formatDate(dateStr: item.expiryDate),
                      type: item.typeName,
                      cityName: item.city?.name ?? '-',
                      onPressed: () {
                        controller.postData = item;
                        // PostDetailsPage(event: controller.postData).navTo();
                      },
                    );
                  }),
            );
          }),
        ),
      ),
    );
  }
}
