import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/extensions/shared_preferences.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_body.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_dto.dart';
import 'package:safaqat/safaqat/data/models/notifications/notification_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/notification/read_notification_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/notification/get_notification_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController extends GetxController {
  final GetNotificationsUseCase _getNotificationsUseCase =
      Get.put(GetNotificationsUseCase());
  final ReadNotificationUseCase _readNotificationUseCase =
  Get.put(ReadNotificationUseCase());
  final incomeScrollController = ScrollController();
  final outgoingScrollController = ScrollController();
  final SharedPreferences _preferences = Get.find();

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

  Rx<Resources<NotificationsResponse>> state =
      Resources<NotificationsResponse>.init().obs;

  RxList<NotificationDto> notifications = <NotificationDto>[].obs;

  void getNotificationsIncome() async {
    final body =
        NotificationBody(customerId: _preferences.id, pageNumber: pageNumberIncome);

    state.value = Resources.loading();

    final result = await _getNotificationsUseCase(params: body);
    state.value = result;
    result.data?.notifications?.let((value) => notifications.value = value);
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

  void read(NotificationDto notification) async =>
    await _readNotificationUseCase(params: notification.id.toString());
}
