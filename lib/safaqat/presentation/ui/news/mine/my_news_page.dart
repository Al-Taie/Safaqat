import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/add_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/news_card_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/top_news_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/mine/my_news_controller.dart';

class MyNewsPage extends StatelessWidget {
  const MyNewsPage({Key? key, this.isLogged = false}) : super(key: key);

  final bool isLogged;

  Widget tabItem({
    required Status status,
    required VoidCallback apiCall,
    required ScrollController scrollController,
    required List<NewsDto> data,
  }) {
    return StatusWidget(
      status: status,
      onClickTryAgain: apiCall,
      child: Expanded(
        child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              16,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              var item = data[index];
              return NewsCardWidget(
                title: (Utils.isRTL ? item.titleAr : item.titleEn) ?? '-',
                name: item.ownerName ?? '-',
                image: item.images?.firstOrNull ?? '',
                date: Utils.formatDate(dateStr: item.date),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyNewsController());
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
                    child: Text(AppStrings.rejected),
                  ),
                ],
              ),
              onBack: Get.back,
            ),
            body: TabBarView(
              children: [
                Obx(() => tabItem(
                      status: controller.status.value.status,
                      apiCall: controller.getApprovedNews,
                      scrollController: controller.acceptedScrollController,
                      data: controller.acceptedNews,
                    )),
                Obx(() => tabItem(
                      status: controller.status.value.status,
                      apiCall: controller.getWaitedNews,
                      scrollController: controller.waitedScrollController,
                      data: controller.waitedNews,
                    )),
                Obx(() => tabItem(
                      status: controller.status.value.status,
                      apiCall: controller.getRejectedNews,
                      scrollController: controller.rejectedScrollController,
                      data: controller.rejectedNews,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
