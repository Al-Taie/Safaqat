import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/domain/entities/news_type.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/add_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/news_items_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/top_news_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/edit/edit_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/mine/my_news_controller.dart';

class MyNewsPage extends StatelessWidget {
  const MyNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyNewsController());
    NewsType type = NewsType.accepted;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: Obx(
              () => CustomFloatingButton(
                title: AppStrings.addNewNews,
                icon: AppDrawable.icAdd,
                isExtended: controller.isFloatingButtonExtended.value,
                onClick: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  const AddNewsPage().navTo();
                },
              ),
            ),
            appBar: AppBarWidget(
              width: Get.width,
              onBackPressed: Get.back,
              title: AppStrings.manageNews,
              bottom: TabBar(
                labelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.shadePrimary,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.posted),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.waited),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.7),
                    child: Text(AppStrings.rejected),
                  ),
                ],
                onTap: (index) {
                  if (index == NewsType.accepted.index - 1) {
                    type = NewsType.accepted;
                  } else if (index == NewsType.waited.index + 1) {
                    type = NewsType.waited;
                  } else {
                    type = NewsType.rejected;
                  }
                },
              ),
              onSearch: (String query) => controller.searchNews(type, query),
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                TabBarView(
                  children: [
                    Obx(
                      () => NewsItemsWidget(
                        status: controller.acceptedStatus.value.status,
                        apiCall: controller.getApprovedNews,
                        scrollController: controller.acceptedScrollController,
                        data: controller.filteredAcceptedNews.value,
                        isLogged: true,
                        onEdit: (value) {
                          EditNewsPage(news: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deleteNews(
                              type: NewsType.accepted, id: value.id);
                        },
                        onPressed: (value) {
                          controller.newsData = value;
                        },
                        onScrollUpPressed: () {
                          controller.acceptedPageNumber--;
                        },
                        scrollButtonVisibility: controller.isAcceptedScrollable,
                      ),
                    ),
                    Obx(
                      () => NewsItemsWidget(
                        status: controller.waitedStatus.value.status,
                        apiCall: controller.getWaitedNews,
                        scrollController: controller.waitedScrollController,
                        data: controller.filteredWaitedNews.value,
                        isLogged: true,
                        onEdit: (value) {
                          EditNewsPage(news: value).navTo();
                        },
                        onDelete: (value) {
                          controller.deleteNews(
                              type: NewsType.waited, id: value.id);
                        },
                        onPressed: (value) {
                          controller.newsData = value;
                        },
                        onScrollUpPressed: () {
                          controller.waitedPageNumber--;
                        },
                        scrollButtonVisibility: controller.isWaitedScrollable,
                      ),
                    ),
                    Obx(
                      () => NewsItemsWidget(
                        status: controller.rejectedStatus.value.status,
                        apiCall: controller.getRejectedNews,
                        scrollController: controller.rejectedScrollController,
                        data: controller.filteredRejectedNews.value,
                        isLogged: true,
                        onPressed: (value) {
                          controller.newsData = value;
                        },
                        onScrollUpPressed: () {
                          controller.rejectedPageNumber--;
                        },
                        scrollButtonVisibility: controller.isRejectedScrollable,
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
