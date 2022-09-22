import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safaqat/safaqat/app/extensions/int_extension.dart';
import 'package:safaqat/safaqat/data/models/auth/register/register_body.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/get_cities_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/get_countires_usecase.dart';
import 'package:safaqat/safaqat/domain/usecase/auth/register/register_usecase.dart';

class RegisterController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCountries();
  }

  final RegisterUseCase _registerUsecase = Get.find();
  final GetCountriesUseCase _getCountriesUseCase = Get.find();
  final GetCitiesUseCase _getCitiesUseCase = Get.find();

  final Rx<Resources> status = Resources.init().obs;
  final RxList<CountryDto> countries = <CountryDto>[].obs;
  final RxList<CityDto> cities = <CityDto>[].obs;

  final _firstNameAr = ''.obs;

  String get firstNameAr => _firstNameAr.value;

  set firstNameAr(String value) => _firstNameAr.value = value;

  final _lastNameAr = ''.obs;

  String get lastNameAr => _lastNameAr.value;

  set lastNameAr(String value) => _lastNameAr.value = value;

  final _secondNameAr = ''.obs;

  String get secondNameAr => _secondNameAr.value;

  set secondNameAr(String value) => _secondNameAr.value = value;

  final _firstNameEn = ''.obs;

  String get firstNameEn => _firstNameEn.value;

  set firstNameEn(String value) => _firstNameEn.value = value;

  final _secondNameEn = ''.obs;

  String get secondNameEn => _secondNameEn.value;

  set secondNameEn(String value) => _secondNameEn.value = value;

  final _lastNameEn = ''.obs;

  String get lastNameEn => _lastNameEn.value;

  set lastNameEn(String value) => _lastNameEn.value = value;

  final _nationality = CountryDto().obs;

  CountryDto get nationality => _nationality.value;

  set nationality(CountryDto value) => _nationality.value = value;

  final _country = CountryDto().obs;

  CountryDto get country => _country.value;

  set country(CountryDto value) => _country.value = value;

  final _city = CityDto().obs;

  CityDto get city => _city.value;

  set city(CityDto value) => _city.value = value;

  String get address => '${country.name} - ${city.name}';

  final _phone = ''.obs;

  String get phone => _phone.value;

  set phone(String value) => _phone.value = value;

  final _anotherPhone = ''.obs;

  String get anotherPhone => _anotherPhone.value;

  set anotherPhone(String value) => _anotherPhone.value = value;

  final _email = ''.obs;

  String get email => _email.value;

  set email(String value) => _email.value = value;

  final _anotherEmail = ''.obs;

  String get anotherEmail => _anotherEmail.value;

  set anotherEmail(String value) => _anotherEmail.value = value;

  final _organization = ''.obs;

  String get organization => _organization.value;

  set organization(String value) => _organization.value = value;

  final _jobPosition = ''.obs;

  String get jobPosition => _jobPosition.value;

  set jobPosition(String value) => _jobPosition.value = value;

  final _username = ''.obs;

  String get username => _username.value;

  set username(String value) => _username.value = value;

  final _password = ''.obs;

  String get password => _password.value;

  set password(String value) => _password.value = value;

  final _confirmPassword = ''.obs;

  String get confirmPassword => _confirmPassword.value;

  set confirmPassword(String value) => _confirmPassword.value = value;

  final _agreeTerms = false.obs;

  bool get agreeTerms => _agreeTerms.value;

  set agreeTerms(bool value) => _agreeTerms.value = value;

  final _receiveNewsletters = false.obs;

  bool get receiveNewsletters => _receiveNewsletters.value;

  set receiveNewsletters(bool value) => _receiveNewsletters.value = value;

  final _born = ''.obs;

  String get born => _born.value;

  set born(String value) => _born.value = value;

  final _photo = ''.obs;

  String get photo => _photo.value;

  set photo(String value) => _photo.value = value;

  String get fullNameAr => '$firstNameAr $secondNameAr $lastNameAr';

  String get fullNameEn => '$firstNameEn $secondNameEn $lastNameEn';
  Uint8List imageBytes = Uint8List.fromList([0]);

  void register() async {
    status.value = Resources.loading();
    final RegisterBody body = RegisterBody(
      firstNameAr: firstNameAr,
      secondNameAr: secondNameAr,
      thirdNameAr: lastNameAr,
      firstMotherNameAr: '',
      secondMotherNameAr: '',
      thirdMotherNameAr: '',
      firstNameEn: firstNameEn,
      secondNameEn: secondNameEn,
      thirdNameEn: lastNameEn,
      genderCode: 1,
      email1: email,
      email2: anotherEmail,
      telNo1: phone,
      telNo2: anotherPhone,
      addressLine1: 'addressLine1',
      addressLine2: 'addressLine2',
      nationalityCode: nationality.countryNo,
      birthDate: born,
      cityCode: city.cityNo,
      countryNo: country.countryNo,
      institution: null,
      jobTitle: jobPosition,
      experiencesA: null,
      experiencesB: null,
      userAcct: username,
      userPassword: password,
      photo: photo,
      comment: 'comment',
      filled: 1,
    );

    final result = await _registerUsecase(params: body);
    status.value = result;
  }

  void loadPhoto() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 150,
      maxWidth: 150,
      imageQuality: 100,
    );

    final bytes = await pickedFile?.readAsBytes();

    if (bytes != null) {
      imageBytes = bytes;
      photo = base64Encode(bytes);
    }
  }

  void getCountries() async {
    status.value = Resources.loading();
    final result = await _getCountriesUseCase();
    if (result.data != null) {
      countries.value = result.data!;
    }
    status.value = result;
  }

  void getCities() async {
    status.value = Resources.loading();
    final result = await _getCitiesUseCase(
      params: country.countryNo.toIntOrZero(),
    );

    if (result.data != null) {
      cities.value = result.data!;
    }
    status.value = result;
  }
}
