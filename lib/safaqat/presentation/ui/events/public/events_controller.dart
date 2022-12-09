import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/events/event_query.dart';
import 'package:safaqat/safaqat/data/models/events/events_response.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/logout/delete_user_info_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/events/get_events_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';

class EventsController extends GetxController {
  final DeleteUserInfoUseCase _logoutUseCase = Get.put(DeleteUserInfoUseCase());
  final GetEventsUseCase _getEventsUseCase = Get.put(GetEventsUseCase());
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_pagination);
    scrollController.addListener(_floatingButtonState);
    getEvents();
  }

  final isFloatingButtonExtended = true.obs;

  final _pageNumber = 1.obs;
  var _maxNumberOfPages = 1;

  int get pageNumber => _pageNumber.value;

  set pageNumber(int value) => _pageNumber.value = value;

  final _eventData = EventDto().obs;
  EventDto get eventData => _eventData.value;
  set eventData(EventDto value) => _eventData.value = value;

  Rx<Resources<EventsResponse>> status = Resources<EventsResponse>.init().obs;

  RxList<EventDto> event = <EventDto>[].obs;
  RxList<EventDto> filteredEvents = <EventDto>[].obs;

  final _query = ''.obs;

  String get query => _query.value;

  set query(String value) => _query.value = value;

  void getEvents() async {
    final body = EventQuery(pageNumber: pageNumber);

    status.value = Resources.loading();

    final result = await _getEventsUseCase(params: body);
    status.value = result;

    if (result.data?.events != null) {
      event.value = result.data!.events!;
      filteredEvents.value = event.value;
    }
    _maxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchEvents(String query) {
    List<EventDto> newFilteredData = event.value;

    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();

    filteredEvents.value = newFilteredData;
  }

  void _pagination() {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < _maxNumberOfPages)) {
      pageNumber++;
      isFloatingButtonExtended.value = true;
      getEvents();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      pageNumber--;
      isFloatingButtonExtended.value = true;
      getEvents();
    }
  }

  void _floatingButtonState() {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void logout() {
    _logoutUseCase();
    Get.offAll(() => const LoginPage());
  }
}
