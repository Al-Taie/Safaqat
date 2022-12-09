import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/data/models/events/event_query.dart';
import 'package:safaqat/safaqat/data/models/events/events_response.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_category.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/events/delete_event_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/events/get_my_events_usecase.dart';

class MyEventsController extends GetxController {
  final GetMyEventsUseCase _getMyEventsUseCase = Get.put(GetMyEventsUseCase());
  final DeleteEventUseCase _deleteEventUseCase = Get.put(DeleteEventUseCase());

  final generalScrollController = ScrollController();
  final conferenceScrollController = ScrollController();
  final trainingCourseScrollController = ScrollController();

  final exhibitionScrollController = ScrollController();
  final seminarScrollController = ScrollController();
  final forumScrollController = ScrollController();

  final _isGeneralScrollable = false.obs;
  bool get isGeneralScrollable => _isGeneralScrollable.value;
  set isGeneralScrollable(bool value) => _isGeneralScrollable.value = value;

  final _isConferenceScrollable = false.obs;
  bool get isConferenceScrollable => _isConferenceScrollable.value;
  set isConferenceScrollable(bool value) =>
      _isConferenceScrollable.value = value;

  final _isTrainingCourseScrollable = false.obs;
  bool get isTrainingCourseScrollable => _isTrainingCourseScrollable.value;
  set isTrainingCourseScrollable(bool value) =>
      _isTrainingCourseScrollable.value = value;

  final _isExhibitionScrollable = false.obs;
  bool get isExhibitionScrollable => _isExhibitionScrollable.value;
  set isExhibitionScrollable(bool value) =>
      _isExhibitionScrollable.value = value;

  final _isSeminarScrollable = false.obs;
  bool get isSeminarScrollable => _isSeminarScrollable.value;
  set isSeminarScrollable(bool value) => _isSeminarScrollable.value = value;

  final _isForumScrollable = false.obs;
  bool get isForumScrollable => _isForumScrollable.value;
  set isForumScrollable(bool value) => _isForumScrollable.value = value;

  @override
  void onInit() {
    super.onInit();

    generalScrollController.addListener(() => _pagination(
          apiCall: getGeneralEvents,
          onValueChange: (int value) {
            generalPageNumber = value;
          },
          scrollController: generalScrollController,
          pageNumber: generalPageNumber,
          maxNumberOfPages: _generalMaxNumberOfPages,
        ));

    conferenceScrollController.addListener(() => _pagination(
          apiCall: getConferenceEvents,
          onValueChange: (int value) {
            conferencePageNumber = value;
          },
          scrollController: conferenceScrollController,
          pageNumber: conferencePageNumber,
          maxNumberOfPages: _conferenceMaxNumberOfPages,
        ));

    trainingCourseScrollController.addListener(() {
      return _pagination(
        apiCall: getTrainingCourseEvents,
        onValueChange: (int value) {
          trainingCoursePageNumber = value;
        },
        scrollController: trainingCourseScrollController,
        pageNumber: trainingCoursePageNumber,
        maxNumberOfPages: _trainingCourseMaxNumberOfPages,
      );
    });

    exhibitionScrollController.addListener(() => _pagination(
          apiCall: getExhibitionEvents,
          onValueChange: (int value) {
            exhibitionPageNumber = value;
          },
          scrollController: exhibitionScrollController,
          pageNumber: exhibitionPageNumber,
          maxNumberOfPages: _exhibitionMaxNumberOfPages,
        ));

    seminarScrollController.addListener(() => _pagination(
          apiCall: getSeminarEvents,
          onValueChange: (int value) {
            seminarPageNumber = value;
          },
          scrollController: seminarScrollController,
          pageNumber: seminarPageNumber,
          maxNumberOfPages: _seminarMaxNumberOfPages,
        ));

    forumScrollController.addListener(() => _pagination(
          apiCall: getForumEvents,
          onValueChange: (int value) {
            forumPageNumber = value;
          },
          scrollController: forumScrollController,
          pageNumber: forumPageNumber,
          maxNumberOfPages: _forumMaxNumberOfPages,
        ));

    generalScrollController.addListener(
        () => _floatingButtonState(scrollController: generalScrollController));

    conferenceScrollController.addListener(() =>
        _floatingButtonState(scrollController: conferenceScrollController));

    trainingCourseScrollController.addListener(() =>
        _floatingButtonState(scrollController: trainingCourseScrollController));

    exhibitionScrollController.addListener(() =>
        _floatingButtonState(scrollController: exhibitionScrollController));

    seminarScrollController.addListener(() =>
        _floatingButtonState(scrollController: seminarScrollController));

    forumScrollController.addListener(() =>
        _floatingButtonState(scrollController: forumScrollController));

    getGeneralEvents();
    getConferenceEvents();
    getTrainingCourseEvents();
    getExhibitionEvents();
    getSeminarEvents();
    getForumEvents();
  }

  final isFloatingButtonExtended = true.obs;

  var _generalMaxNumberOfPages = 1;
  var _conferenceMaxNumberOfPages = 1;
  var _trainingCourseMaxNumberOfPages = 1;

  var _exhibitionMaxNumberOfPages = 1;
  var _seminarMaxNumberOfPages = 1;
  var _forumMaxNumberOfPages = 1;

  final _generalPageNumber = 1.obs;
  int get generalPageNumber => _generalPageNumber.value;
  set generalPageNumber(int value) => _generalPageNumber.value = value;

  final _conferencePageNumber = 1.obs;
  int get conferencePageNumber => _conferencePageNumber.value;
  set conferencePageNumber(int value) => _conferencePageNumber.value = value;

  final _trainingCoursePageNumber = 1.obs;
  int get trainingCoursePageNumber => _trainingCoursePageNumber.value;
  set trainingCoursePageNumber(int value) =>
      _trainingCoursePageNumber.value = value;

  final _exhibitionPageNumber = 1.obs;
  int get exhibitionPageNumber => _exhibitionPageNumber.value;
  set exhibitionPageNumber(int value) => _exhibitionPageNumber.value = value;

  final _seminarPageNumber = 1.obs;
  int get seminarPageNumber => _seminarPageNumber.value;
  set seminarPageNumber(int value) => _seminarPageNumber.value = value;

  final _forumPageNumber = 1.obs;
  int get forumPageNumber => _forumPageNumber.value;
  set forumPageNumber(int value) => _forumPageNumber.value = value;

  final _eventData = EventDto().obs;
  EventDto get eventData => _eventData.value;
  set eventData(EventDto value) => _eventData.value = value;

  Rx<Resources<dynamic>> status = Resources<dynamic>.init().obs;

  Rx<Resources<EventsResponse>> generalStatus =
      Resources<EventsResponse>.init().obs;
  Rx<Resources<EventsResponse>> conferenceStatus =
      Resources<EventsResponse>.init().obs;
  Rx<Resources<EventsResponse>> trainingCourseStatus =
      Resources<EventsResponse>.init().obs;

  Rx<Resources<EventsResponse>> exhibitionStatus =
      Resources<EventsResponse>.init().obs;
  Rx<Resources<EventsResponse>> seminarStatus =
      Resources<EventsResponse>.init().obs;
  Rx<Resources<EventsResponse>> forumStatus =
      Resources<EventsResponse>.init().obs;

  RxList<EventDto> generalEvents = <EventDto>[].obs;
  RxList<EventDto> filteredGeneralEvents = <EventDto>[].obs;
  RxList<EventDto> conferenceEvents = <EventDto>[].obs;
  RxList<EventDto> filteredConferenceEvents = <EventDto>[].obs;
  RxList<EventDto> trainingCourseEvents = <EventDto>[].obs;
  RxList<EventDto> filteredTrainingCourseEvents = <EventDto>[].obs;

  RxList<EventDto> exhibitionEvents = <EventDto>[].obs;
  RxList<EventDto> filteredExhibitionEvents = <EventDto>[].obs;
  RxList<EventDto> seminarEvents = <EventDto>[].obs;
  RxList<EventDto> filteredSeminarEvents = <EventDto>[].obs;
  RxList<EventDto> forumEvents = <EventDto>[].obs;
  RxList<EventDto> filteredForumEvents = <EventDto>[].obs;

  void getGeneralEvents() async {
    final params = EventQuery(
      pageNumber: generalPageNumber,
      type: EventCategory.general.index,
    );

    generalStatus.value = Resources.loading();

    final result = await _getMyEventsUseCase(params: params);
    generalStatus.value = result;

    if (result.data?.events != null) {
      generalEvents.value = result.data!.events!;
      filteredGeneralEvents.value = generalEvents.value;
    }

    _generalMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getConferenceEvents() async {
    final params = EventQuery(
      pageNumber: conferencePageNumber,
      type: EventCategory.conference.index,
    );

    conferenceStatus.value = Resources.loading();

    final result = await _getMyEventsUseCase(params: params);
    conferenceStatus.value = result;

    if (result.data?.events != null) {
      conferenceEvents.value = result.data!.events!;
      filteredConferenceEvents.value = conferenceEvents.value;
    }

    _conferenceMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getTrainingCourseEvents() async {
    final params = EventQuery(
      pageNumber: trainingCoursePageNumber,
      type: EventCategory.trainingCourse.index,
    );

    trainingCourseStatus.value = Resources.loading();

    final result = await _getMyEventsUseCase(params: params);
    trainingCourseStatus.value = result;

    if (result.data?.events != null) {
      trainingCourseEvents.value = result.data!.events!;
      filteredTrainingCourseEvents.value = trainingCourseEvents.value;
    }

    _trainingCourseMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getExhibitionEvents() async {
    final params = EventQuery(
      pageNumber: exhibitionPageNumber,
      type: EventCategory.exhibition.index,
    );

    exhibitionStatus.value = Resources.loading();

    final result = await _getMyEventsUseCase(params: params);
    exhibitionStatus.value = result;

    if (result.data?.events != null) {
      exhibitionEvents.value = result.data!.events!;
      filteredExhibitionEvents.value = exhibitionEvents.value;
    }

    _exhibitionMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getSeminarEvents() async {
    final params = EventQuery(
      pageNumber: seminarPageNumber,
      type: EventCategory.seminar.index,
    );

    seminarStatus.value = Resources.loading();

    final result = await _getMyEventsUseCase(params: params);
    seminarStatus.value = result;

    if (result.data?.events != null) {
      seminarEvents.value = result.data!.events!;
      filteredSeminarEvents.value = seminarEvents.value;
    }

    _seminarMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void getForumEvents() async {
    final params = EventQuery(
      pageNumber: forumPageNumber,
      type: EventCategory.forum.index,
    );

    forumStatus.value = Resources.loading();

    final result = await _getMyEventsUseCase(params: params);
    forumStatus.value = result;

    if (result.data?.events != null) {
      forumEvents.value = result.data!.events!;
      filteredForumEvents.value = forumEvents.value;
    }

    _forumMaxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchEvents(EventCategory type, String query) {
    var newFilteredData = <EventDto>[];

    if (type == EventCategory.general) {
      newFilteredData = generalEvents;
    } else if (type == EventCategory.conference) {
      newFilteredData = conferenceEvents;
    } else {
      newFilteredData = trainingCourseEvents;
    }

    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();

    if (type == EventCategory.general) {
      filteredGeneralEvents.value = newFilteredData;
    } else if (type == EventCategory.conference) {
      filteredConferenceEvents.value = newFilteredData;
    } else {
      filteredTrainingCourseEvents.value = newFilteredData;
    }
  }

  void _pagination({
    required VoidCallback apiCall,
    required ValueChanged<int> onValueChange,
    required ScrollController scrollController,
    required int pageNumber,
    required int maxNumberOfPages,
  }) {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < maxNumberOfPages)) {
      onValueChange(++pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      onValueChange(--pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    }
  }

  void _floatingButtonState({required ScrollController scrollController}) {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void deleteEvents({required EventCategory type, String? id}) async {
    Get.back();
    status.value = Resources.loading();
    final result = await _deleteEventUseCase(params: id);
    status.value = result;

    if (result.status != Status.success) {
      AppStrings.deletedFailed.toToast();
      return;
    }

    AppStrings.deletedSuccessfully.toToast();

    if (type == EventCategory.general) {
      generalEvents.removeWhere((it) => it.id == id);
    } else if (type == EventCategory.conference) {
      conferenceEvents.removeWhere((it) => it.id == id);
    } else if (type == EventCategory.trainingCourse) {
      trainingCourseEvents.removeWhere((it) => it.id == id);
    } else if (type == EventCategory.exhibition) {
      exhibitionEvents.removeWhere((it) => it.id == id);
    } else if (type == EventCategory.seminar) {
      seminarEvents.removeWhere((it) => it.id == id);
    } else {
      forumEvents.removeWhere((it) => it.id == id);
    }
  }
}
