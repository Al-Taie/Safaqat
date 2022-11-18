import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/add_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/details/news_details_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/main/components/app_drawer.dart';
import 'package:safaqat/safaqat/presentation/ui/news/main/components/news_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/main/components/top_news_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/main/news_controller.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key, this.isLogged = false}) : super(key: key);

  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());
    // Logger.log(Get.find<SharedPreferences>().getString(PrefsKeys.username));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: isLogged
                ? Obx(
                    () => CustomFloatingButton(
                      title: AppStrings.addNewNews,
                      icon: AppDrawable.icAdd,
                      isExtended: controller.isFloatingButtonExtended.value,
                      onClick: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        const AddNewsPage().navTo();
                      },
                    ),
                  )
                : null,
            drawer: AppDrawer(
              name: 'Ahmed Mones Ahmed',
              imageUrl: 'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wyTK?ver=a46a',
              onManageNews: () {},
              onProfile: () {},
            ),
            appBar: TopNewsWidget(
              width: Get.width,
              height: Get.height / 3.5,
              rate: 0.75,
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
                    child: Text(AppStrings.drafts),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Obx(
                  () {
                    var news = controller.news.value.data?.news;
                    return StatusWidget(
                      status: controller.news.value.status,
                      onClickTryAgain: controller.getNews,
                      child: Expanded(
                        child: ListView.builder(
                            controller: controller.scrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(
                              16,
                              8,
                              16,
                              16,
                            ),
                            itemCount: news?.length ?? 0,
                            itemBuilder: (context, index) {
                              var item = news?[index];
                              return NewsCardWidget(
                                title: (Utils.isRTL
                                        ? item?.titleAr
                                        : item?.titleEn) ??
                                    '-',
                                name: item?.ownerName ?? '-',
                                image: item?.images?.firstOrNull ?? '',
                                date: Utils.formatDate(dateStr: item?.date),
                              );
                            }),
                      ),
                    );
                  },
                ),
                Obx(
                  () {
                    var news = controller.news.value.data?.news;
                    return StatusWidget(
                      status: controller.news.value.status,
                      onClickTryAgain: controller.getNews,
                      child: Expanded(
                        child: ListView.builder(
                            controller: controller.scrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(
                              16,
                              8,
                              16,
                              16,
                            ),
                            itemCount: news?.length ?? 0,
                            itemBuilder: (context, index) {
                              var item = news?[index];
                              return NewsCardWidget(
                                title: (Utils.isRTL
                                        ? item?.titleAr
                                        : item?.titleEn) ??
                                    '-',
                                name: item?.ownerName ?? '-',
                                image: item?.images?.firstOrNull ?? '',
                                date: Utils.formatDate(dateStr: item?.date),
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  if (item != null) {
                                    controller.newsData = item;
                                  }
                                  NewsDetailsPage(news: controller.newsData)
                                      .navTo();
                                },
                              );
                            }),
                      ),
                    );
                  },
                ),
                Obx(
                  () {
                    var news = controller.news.value.data?.news;
                    return StatusWidget(
                      status: controller.news.value.status,
                      onClickTryAgain: controller.getNews,
                      child: Expanded(
                        child: ListView.builder(
                            controller: controller.scrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(
                              16,
                              8,
                              16,
                              16,
                            ),
                            itemCount: news?.length ?? 0,
                            itemBuilder: (context, index) {
                              var item = news?[index];
                              return NewsCardWidget(
                                title: (Utils.isRTL
                                        ? item?.titleAr
                                        : item?.titleEn) ??
                                    '-',
                                name: item?.ownerName ?? '-',
                                image: item?.images?.firstOrNull ?? '',
                                date: Utils.formatDate(dateStr: item?.date),
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  if (item != null) {
                                    controller.newsData = item;
                                  }
                                  NewsDetailsPage(news: controller.newsData)
                                      .navTo();
                                },
                              );
                            }),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
