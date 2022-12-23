import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/events/event_body.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_type.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_stakeholder_type.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_attend.dart';
import 'package:safaqat/safaqat/domain/entities/events/stakeholder.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/events/add_event_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/app_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_controller.dart';

class AddEventController extends GetxController {
  final _addEventUseCase = Get.put(AddEventUseCase());
  final AppController _appController = Get.find();
  final LocationController locationController = Get.find();
  final MyEventsController _myEventsController = Get.find();

  final GlobalKey<FormState> eventTypeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> eventAttendFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> eventstakeHolderTypeFormKey =
      GlobalKey<FormState>();

  final RxBool detailsExpanded = false.obs;
  final RxBool arabicExpanded = false.obs;
  final RxBool englishExpanded = false.obs;
  final RxBool imagesExpanded = false.obs;
  final RxBool typeExpaned = false.obs;
  final RxBool attendExpaned = false.obs;
  final RxBool stakeHolderTypeExpanded = false.obs;
  final RxBool stakeHolderExpanded = false.obs;
  final RxBool stakeholderImageExpanded = false.obs;
  final Rx<String?> initialStakeholderTypeValue = Rx(null);
  final Rx<String?> initialNameValue = Rx(null);

  static const int maxImages = 10;
  static const List<String> allowedImageTypes = ['png', 'jpg', 'jpeg'];
  final imageController = MultiImagePickerController(
    maxImages: maxImages,
    allowedImageTypes: allowedImageTypes,
  );

  final Rx<Stakeholder?> _stakeholder = Rx(null);
  Stakeholder? get stakeholder => _stakeholder.value;
  set stakeholder(Stakeholder? value) => _stakeholder.value = value;

  void resetSingleImageLoader() {
    singleImageController.value = MultiImagePickerController(
      maxImages: 1,
      allowedImageTypes: allowedImageTypes,
    );
  }

  Rx<MultiImagePickerController> singleImageController =
      MultiImagePickerController(
    maxImages: 1,
    allowedImageTypes: allowedImageTypes,
  ).obs;

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  final RxList<String> tagsAr = <String>[].obs;
  final RxList<String> tagsEn = <String>[].obs;
  final RxList<Stakeholder> stakeholders = <Stakeholder>[].obs;

  RxList<CountryDto> get countries => _appController.countries;
  RxList<CityDto> get cities => _appController.cities;

  CountryDto get country => _appController.country;
  set country(CountryDto value) => _appController.country = value;

  CityDto get city => _appController.city;
  set city(CityDto value) => _appController.city = value;

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

  File stakeholderLogo = File('');

  final _stakeholderType = EventStakeHolderType.organizer.obs;
  EventStakeHolderType get stakeholderType => _stakeholderType.value;
  set stakeholderType(EventStakeHolderType value) =>
      _stakeholderType.value = value;

  final _stakeholderOrder = 0.obs;
  int get stakeholderOrder => _stakeholderOrder.value;
  set stakeholderOrder(int value) => _stakeholderOrder.value = value;

  final _sponsorType = ''.obs;
  String get sponsorType => _sponsorType.value;
  set sponsorType(String value) => _sponsorType.value = value;

  final _stakeholderName = ''.obs;
  String get stakeholderName => _stakeholderName.value;
  set stakeholderName(String value) => _stakeholderName.value = value;

  void publish() async {
    status.value = Resources.loading();

    final EventBody body = EventBody(
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
      stakeholders: [
        Stakeholder(
          sponsorType: sponsorType,
          stakeholderName: stakeholderName,
          stakeholderLogo: stakeholderLogo,
          stakeholderOrder: stakeholderOrder,
          stakeholderType: stakeholderType,
        )
      ],
      coordinates: locationController.targetPlace?.toCoordinates() ??
          locationController.targetMarker?.toCoordinates(),
    );

    final result = await _addEventUseCase(params: body);
    status.value = result;

    if (result.status == Status.success) {
      // _myEventsController.waitedEvents.add(result.data!);
    }
  }
}
