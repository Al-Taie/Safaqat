import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/status_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/notification/components/notification_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/notification/notification_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());
    final color = AppColors.primaryColor.withOpacity(0.1);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBarWidget(
          width: Get.width,
          title: AppStrings.notifications,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.incoming,
                    style: AppTextStyle.title.copyWith(fontSize: 18),
                  ),
                  Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Obx(
                        () => Text(
                          controller.notifications.value.length.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: Get.width,
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.sender,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: AppColors.background,
                        ),
                      ),
                      Text(
                        AppStrings.date,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: AppColors.background,
                        ),
                      ),
                      Text(
                        AppStrings.status,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: AppColors.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () {
                  var notifications = controller.notifications.value;
                  return Flexible(
                    child: StatusWidget(
                      status: controller.state.value.status,
                      onClickTryAgain: controller.getNotificationsIncome,
                      child: ListView.separated(
                        controller: controller.incomeScrollController,
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          16,
                        ),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          var item = notifications[index];
                          return NotificationWidget(
                            name: item.customerName ?? '-',
                            read: item.isRead,
                            color: color,
                            description: item.description ?? '-',
                            incoming: item.isIncoming,
                            date: Utils.formatDate(
                              dateStr: item.date,
                              format: Utils.dateTimeFormat,
                            ),
                            onDelete: () => controller.delete(item),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(color: color),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
