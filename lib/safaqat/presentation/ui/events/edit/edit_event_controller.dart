import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/events/event_body.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/domain/entities/events/edit_event_params.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_type.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_attend.dart';
import 'package:safaqat/safaqat/domain/entities/events/stakeholder.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/events/edit_event_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/app_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_controller.dart';

class EditEventController extends GetxController {
  final _editEventUseCase = Get.put(EditEventUseCase());
  final AppController _appController = Get.find();
  final LocationController locationController = Get.find();
  final MyEventsController _myEventsController = Get.find();

  var event = EventDto();

  final GlobalKey<FormState> eventTypeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> eventAttendFormKey = GlobalKey<FormState>();

  final RxBool detailsExpanded = false.obs;
  final RxBool arabicExpanded = false.obs;
  final RxBool englishExpanded = false.obs;
  final RxBool imagesExpanded = false.obs;
  final RxBool typeExpaned = false.obs;
  final RxBool attendExpaned = false.obs;

  static const int maxImages = 10;
  static const List<String> allowedImageTypes = ['png', 'jpg', 'jpeg'];
  final MultiImagePickerController imageController = MultiImagePickerController(
    maxImages: maxImages,
    allowedImageTypes: allowedImageTypes,
  );

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  RxList<CountryDto> get countries => _appController.countries;
  RxList<CityDto> get cities => _appController.cities;

  CountryDto get country => _appController.country;
  set country(CountryDto value) => _appController.country = value;

  CityDto get city => _appController.city;
  set city(CityDto value) => _appController.city = value;

  final RxList<String> tagsAr = <String>[].obs;
  final RxList<String> tagsEn = <String>[].obs;

  final _startAt = ''.obs;
  String get startAt => _startAt.value;
  set startAt(String value) => _startAt.value = value;

  final _endAt = ''.obs;
  String get endAt => _endAt.value;
  set endAt(String value) => _endAt.value = value;

  final _email = ''.obs;
  String get email => _email.value;
  set email(String value) => _email.value = value;

  final _phone = ''.obs;
  String get phone => _phone.value;
  set phone(String value) => _phone.value = value;

  final _website = ''.obs;
  String get website => _website.value;
  set website(String value) => _website.value = value;

  final _titleAr = ''.obs;
  String get titleAr => _titleAr.value;
  set titleAr(String value) => _titleAr.value = value;

  final _titleEn = ''.obs;
  String get titleEn => _titleEn.value;
  set titleEn(String value) => _titleEn.value = value;

  final _detailsAr = ''.obs;
  String get detailsAr => _detailsAr.value;
  set detailsAr(String value) => _detailsAr.value = value;

  final _detailsEn = ''.obs;
  String get detailsEn => _detailsEn.value;
  set detailsEn(String value) => _detailsEn.value = value;

  final _showName = false.obs;
  bool get showName => _showName.value;
  set showName(bool value) => _showName.value = value;

  final _type = EventType.general.obs;
  EventType get type => _type.value;
  set type(EventType value) => _type.value = value;

  final _attend = EventAttend.online.obs;
  EventAttend get attend => _attend.value;
  set attend(EventAttend value) => _attend.value = value;

  final _coordinates = CoordinatesDto().obs;
  CoordinatesDto get coordinates => _coordinates.value;
  set coordinates(CoordinatesDto value) => _coordinates.value = value;

  final _stakeholders = <Stakeholder>[].obs;
  List<Stakeholder> get stakeholders => _stakeholders.value;
  set stakeholders(List<Stakeholder> value) => _stakeholders.value = value;

  void edit() async {
    status.value = Resources.loading();
    final body = EditEventParams(
        eventId: event.id,
        body: EventBody(
          titleAr: titleAr,
          titleEn: titleEn,
          detailsAr: detailsAr,
          detailsEn: detailsEn,
          tagsAr: tagsAr,
          tagsEn: tagsEn,
          showName: showName,
          countryNo: country.countryNo,
          cityCode: city.cityNo,
          startDate: startAt,
          endDate: endAt,
          telephone: phone,
          email: email,
          webSite: website,
          type: type.index,
          attendanceType: attend.index,
          coordinates: coordinates,
          // stakeholders: stakeholders,
        ));

    final result = await _editEventUseCase(params: body);
    status.value = result;

    if (result.status == Status.success) {
      switch (type) {
        case EventType.general:
          var index = _myEventsController.generalEvents.indexOf(event);
          _myEventsController.generalEvents.remove(event);
          _myEventsController.generalEvents.insert(index, result.data!);
          break;
        case EventType.conference:
          var index = _myEventsController.conferenceEvents.indexOf(event);
          _myEventsController.conferenceEvents.remove(event);
          _myEventsController.conferenceEvents.insert(index, result.data!);
          break;
        case EventType.trainingCourse:
          var index = _myEventsController.trainingCourseEvents.indexOf(event);
          _myEventsController.trainingCourseEvents.remove(event);
          _myEventsController.trainingCourseEvents.insert(index, result.data!);
          break;
        case EventType.exhibition:
          var index = _myEventsController.exhibitionEvents.indexOf(event);
          _myEventsController.exhibitionEvents.remove(event);
          _myEventsController.exhibitionEvents.insert(index, result.data!);
          break;
        case EventType.seminar:
          var index = _myEventsController.seminarEvents.indexOf(event);
          _myEventsController.seminarEvents.remove(event);
          _myEventsController.seminarEvents.insert(index, result.data!);
          break;
        case EventType.forum:
          var index = _myEventsController.forumEvents.indexOf(event);
          _myEventsController.forumEvents.remove(event);
          _myEventsController.forumEvents.insert(index, result.data!);
          break;
      }
    }
  }

  void loadEvents(EventDto? event) {
    if (event == null) return;

    titleAr = event.titleAr ?? '';
    titleEn = event.titleEn ?? '';
    detailsAr = event.detailsAr ?? '';
    detailsEn = event.detailsEn ?? '';
    tagsAr.value = event.tagsAr ?? [];
    tagsEn.value = event.tagsEn ?? [];
    phone = event.telephone ?? '';
    email = event.email ?? '';
    startAt = event.startDate ?? '';
    endAt = event.endDate ?? '';
    website = event.webSite ?? '';
    coordinates = event.coordinates ?? CoordinatesDto();
    showName = event.showName ?? false;
    country = event.country ?? CountryDto();
    city = event.city ?? CityDto();
    // stakeholders = event.stakeholders
    //         ?.map((e) => Stakeholder(
    //             stakeholderName: e.name!,
    //             stakeholderOrder: e.order!,
    //             stakeholderType: e.type!.toEventStakeHolderType(),
    //             sponsorType: e.sponsorType!,
    //             stakeholderLogo: File('')))
    //         .toList() ??
    //     [];

    EventType.items
        .find(selector: (e) => e.index == event.type)
        ?.let((value) => type = value);

    EventAttend.items
        .find(selector: (e) => e.index == event.attendanceType)
        ?.let((value) => attend = value);

    locationController.targetMarker = event.coordinates?.toMarker();
  }
}
