import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/add_news_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/news_items_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/components/top_news_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/news/mine/my_news_controller.dart';

class MyNewsPage extends StatelessWidget {
  const MyNewsPage({Key? key}) : super(key: key);

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
                Obx(() => NewsItemsWidget(
                      status: controller.acceptedStatus.value.status,
                      apiCall: controller.getApprovedNews,
                      scrollController: controller.acceptedScrollController,
                      data: controller.acceptedNews,
                      isLogged: true,
                      onEdit: (value) {
                        // TODO: ON EDIT
                      },
                      onDelete: (value) {
                        // TODO: ON DELETE
                      },
                      onPressed: (value) {
                        controller.newsData = value;
                      },
                    )),
                Obx(() => NewsItemsWidget(
                      status: controller.waitedStatus.value.status,
                      apiCall: controller.getWaitedNews,
                      scrollController: controller.waitedScrollController,
                      data: controller.waitedNews,
                      isLogged: true,
                      onEdit: (value) {
                        // TODO: ON EDIT
                      },
                      onDelete: (value) {
                        // TODO: ON DELETE
                      },
                      onPressed: (value) {
                        controller.newsData = value;
                      },
                    )),
                Obx(() => NewsItemsWidget(
                      status: controller.rejectedStatus.value.status,
                      apiCall: controller.getRejectedNews,
                      scrollController: controller.rejectedScrollController,
                      data: controller.rejectedNews,
                      isLogged: true,
                      onEdit: (value) {
                        // TODO: ON EDIT
                      },
                      onDelete: (value) {
                        // TODO: ON DELETE
                      },
                      onPressed: (value) {
                        controller.newsData = value;
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
