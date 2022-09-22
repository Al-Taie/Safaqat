import 'package:json_annotation/json_annotation.dart';

part 'customer_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CustomerDto {
  @JsonKey(name: 'custId')
  String? custId;
  @JsonKey(name: 'cust1nameA')
  String? cust1nameA;
  @JsonKey(name: 'cust2nameA')
  String? cust2nameA;
  @JsonKey(name: 'cust3nameA')
  String? cust3nameA;
  @JsonKey(name: 'custM1nameA')
  String? custM1nameA;
  @JsonKey(name: 'custM2nameA')
  String? custM2nameA;
  @JsonKey(name: 'custM3nameA')
  String? custM3nameA;
  @JsonKey(name: 'cust1nameE')
  String? cust1nameE;
  @JsonKey(name: 'cust2nameE')
  String? cust2nameE;
  @JsonKey(name: 'cust3nameE')
  String? cust3nameE;
  @JsonKey(name: 'genderCode')
  int? genderCode;
  @JsonKey(name: 'nationalityCode')
  int? nationalityCode;
  @JsonKey(name: 'birthDate')
  String? birthDate;
  @JsonKey(name: 'email1')
  String? email1;
  @JsonKey(name: 'email2')
  String? email2;
  @JsonKey(name: 'telNo1')
  String? telNo1;
  @JsonKey(name: 'telNo2')
  String? telNo2;
  @JsonKey(name: 'addressLine1')
  String? addressLine1;
  @JsonKey(name: 'addressLine2')
  String? addressLine2;
  @JsonKey(name: 'cityCode')
  int? cityCode;
  @JsonKey(name: 'countryNo')
  int? countryNo;
  @JsonKey(name: 'institution')
  String? institution;
  @JsonKey(name: 'jobTitle')
  String? jobTitle;
  @JsonKey(name: 'experiencesA')
  String? experiencesA;
  @JsonKey(name: 'experiencesB')
  String? experiencesB;
  @JsonKey(name: 'userAcct')
  String? userAcct;
  @JsonKey(name: 'userPassword')
  String? userPassword;
  @JsonKey(name: 'photo')
  String? photo;
  @JsonKey(name: 'qr')
  String? qr;
  @JsonKey(name: 'newslettersStatus')
  int? newslettersStatus;
  @JsonKey(name: 'showProfile')
  int? showProfile;
  @JsonKey(name: 'showTelNo')
  int? showTelNo;
  @JsonKey(name: 'showEmail')
  int? showEmail;
  @JsonKey(name: 'showMessage')
  int? showMessage;
  @JsonKey(name: 'customerStatus')
  int? customerStatus;
  @JsonKey(name: 'statusDesc')
  String? statusDesc;
  @JsonKey(name: 'interfaceLanguage')
  int? interfaceLanguage;
  @JsonKey(name: 'userPasswordSalt')
  String? userPasswordSalt;
  @JsonKey(name: 'cityCodeNavigation')
  String? cityCodeNavigation;
  @JsonKey(name: 'countryNoNavigation')
  String? countryNoNavigation;
  @JsonKey(name: 'genderCodeNavigation')
  String? genderCodeNavigation;
  @JsonKey(name: 'nationalityCodeNavigation')
  String? nationalityCodeNavigation;

  CustomerDto({
    this.custId,
    this.cust1nameA,
    this.cust2nameA,
    this.cust3nameA,
    this.custM1nameA,
    this.custM2nameA,
    this.custM3nameA,
    this.cust1nameE,
    this.cust2nameE,
    this.cust3nameE,
    this.genderCode,
    this.nationalityCode,
    this.birthDate,
    this.email1,
    this.email2,
    this.telNo1,
    this.telNo2,
    this.addressLine1,
    this.addressLine2,
    this.cityCode,
    this.countryNo,
    this.institution,
    this.jobTitle,
    this.experiencesA,
    this.experiencesB,
    this.userAcct,
    this.userPassword,
    this.photo,
    this.qr,
    this.newslettersStatus,
    this.showProfile,
    this.showTelNo,
    this.showEmail,
    this.showMessage,
    this.customerStatus,
    this.statusDesc,
    this.interfaceLanguage,
    this.userPasswordSalt,
    this.cityCodeNavigation,
    this.countryNoNavigation,
    this.genderCodeNavigation,
    this.nationalityCodeNavigation,
  });

  factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDtoToJson(this);
}
