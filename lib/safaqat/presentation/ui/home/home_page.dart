import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/home/components/news_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/home/components/top_home_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/news/details/news_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          TopHomeWidget(
            width: Get.width,
            height: Get.height / 2.945,
            title: AppStrings.showLatestNews,
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
                        16,
                        16,
                        16,
                      ),
                      itemCount: news?.length ?? 0,
                      itemBuilder: (context, index) {
                        var item = news?[index];
                        return NewsCardWidget(
                          title:
                              (Utils.isRTL ? item?.titleAr : item?.titleEn) ??
                                  '-',
                          name: item?.ownerName ?? '-',
                          image: item?.images?.firstOrNull ?? '',
                          date: Utils.formatDate(dateStr: item?.date),
                          onPressed: () {
                            if (item != null) {
                              controller.newsData = item;
                            }
                            NewsDetailsPage(news: controller.newsData).navTo();
                          },
                        );
                      }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
