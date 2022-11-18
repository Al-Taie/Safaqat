import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_body.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/notification/get_notification_usecase.dart';

class NotificationController extends GetxController {
  final GetNotificationsUseCase _getNotificationsUseCase =
      Get.put(GetNotificationsUseCase());
  final incomeScrollController = ScrollController();
  final outgoingScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    incomeScrollController.addListener(_paginationIncome);
    // outgoingScrollController.addListener(_paginationOutgoing);
    getNotificationsIncome();
  }

  final _pageNumberIncome = 1.obs;
  var _maxNumberOfPagesIncome = 1;

  int get pageNumberIncome => _pageNumberIncome.value;

  set pageNumberIncome(int value) => _pageNumberIncome.value = value;

  final _pageNumberOutgoing = 1.obs;

  int get pageNumberOutgoing => _pageNumberOutgoing.value;

  set pageNumberOutgoing(int value) => _pageNumberOutgoing.value = value;

  final _customerId = 'AF200010000005'.obs;

  String get customerId => _customerId.value;

  set customerId(String value) => _customerId.value = value;

  Rx<Resources<NotificationsResponse>> notifications =
      Resources<NotificationsResponse>.init().obs;

  void getNotificationsIncome() async {
    final body =
        NotificationBody(customerId: customerId, pageNumber: pageNumberIncome);

    notifications.value = Resources.loading();

    final result = await _getNotificationsUseCase(params: body);
    notifications.value = result;
    _maxNumberOfPagesIncome = result.data?.numberOfPages ?? 1;
  }

  void _paginationIncome() {
    if (incomeScrollController.position.isMaxScroll &&
        (pageNumberIncome < _maxNumberOfPagesIncome)) {
      pageNumberIncome++;
      getNotificationsIncome();
    } else if (incomeScrollController.position.isMinScroll &&
        pageNumberIncome > 1) {
      pageNumberIncome--;
      getNotificationsIncome();
    }
  }
}
