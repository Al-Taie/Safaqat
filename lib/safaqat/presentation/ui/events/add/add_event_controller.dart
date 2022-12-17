import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:safaqat/safaqat/app/extensions/int_extension.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/events/event_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/register/get_cities_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/register/get_countires_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/events/add_event_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/events/mine/my_events_controller.dart';
import 'package:tuple/tuple.dart';

class AddEventController extends GetxController {
  final _addEventUseCase = Get.put(AddEventUseCase());
  final GetCountriesUseCase _getCountriesUseCase = Get.find();
  final GetCitiesUseCase _getCitiesUseCase = Get.find();

  final MyEventsController _myEventsController = Get.find();

  @override
  void onInit() {
    super.onInit();
    getCountries();
  }

  final GlobalKey<FormState> eventTypeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> eventAttendFormKey = GlobalKey<FormState>();

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  final RxList<CountryDto> countries = <CountryDto>[].obs;
  final RxList<CityDto> cities = <CityDto>[].obs;

  final RxList<String> tagsAr = <String>[].obs;
  final RxList<String> tagsEn = <String>[].obs;

  final _country = CountryDto().obs;
  CountryDto get country => _country.value;
  set country(CountryDto value) {
    _country.value = value;
    getCities();
  }

  final _city = CityDto().obs;
  CityDto get city => _city.value;
  set city(CityDto value) => _city.value = value;

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

  final _type = 0.obs;
  int get type => _type.value;
  set type(int value) => _type.value = value;

  final _attend = 0.obs;
  int get attend => _attend.value;
  set attend(int value) => _attend.value = value;
  
  final Rx<PlacesSearchResult?> _targetPlace = Rx(null);
  PlacesSearchResult? get targetPlace => _targetPlace.value;
  set targetPlace(PlacesSearchResult? value) => _targetPlace.value = value;

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
        type: type,
        attendanceType: attend,
        stakeholders: [],
        coordinates: targetPlace?.toCoordinates().toStr());

    final result = await _addEventUseCase(params: body);
    status.value = result;

    if (result.status == Status.success) {
      // _myEventsController.waitedEvents.add(result.data!);
    }
  }

  void getCountries() async {
    final result = await _getCountriesUseCase();
    if (result.data != null) {
      countries.value = result.data!;
    }
  }

  void getCities() async {
    final result = await _getCitiesUseCase(
      params: country.countryNo.toIntOrZero(),
    );
    if (result.data != null) {
      cities.value = result.data!;
    }
  }
}
