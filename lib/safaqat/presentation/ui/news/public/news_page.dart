import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/news_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/app_drawer.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/top_news_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/mine/my_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/public/news_controller.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key, this.isLogged = false}) : super(key: key);

  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          drawer: isLogged ? AppDrawer(
            name: 'Ahmed Mones Ahmed',
            imageUrl:
                'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wyTK?ver=a46a',
            onManageNews: const MyNewsPage(isLogged: true).navTo,
            onProfile: () {},
            onLogout: controller.logout,
          ) : null,
          appBar: TopNewsWidget(
            width: Get.width,
            height: Get.height / 3.5,
            rate: 0.75,
            title: AppStrings.showLatestNews,
          ),
          body: Obx(() {
            return StatusWidget(
              status: controller.status.value.status,
              onClickTryAgain: controller.getNews,
              child: ListView.builder(
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    8,
                    16,
                    16,
                  ),
                  itemCount: controller.news.length,
                  itemBuilder: (context, index) {
                    var item = controller.news[index];
                    return NewsCardWidget(
                      title:
                          (Utils.isRTL ? item.titleAr : item.titleEn) ?? '-',
                      name: item.ownerName ?? '-',
                      image: item.images?.firstOrNull ?? '',
                      date: Utils.formatDate(dateStr: item.date),
                    );
                  }),
            );
          }),
        ),
      ),
    );
  }
}
