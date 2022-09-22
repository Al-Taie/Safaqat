import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RegisterBody {
  @JsonKey(name: 'cust1nameA')
  String? firstNameAr;
  @JsonKey(name: 'cust2nameA')
  String? secondNameAr;
  @JsonKey(name: 'cust3nameA')
  String? thirdNameAr;
  @JsonKey(name: 'custM1nameA')
  String? firstMotherNameAr;
  @JsonKey(name: 'custM2nameA')
  String? secondMotherNameAr;
  @JsonKey(name: 'custM3nameA')
  String? thirdMotherNameAr;
  @JsonKey(name: 'cust1nameE')
  String? firstNameEn;
  @JsonKey(name: 'cust2nameE')
  String? secondNameEn;
  @JsonKey(name: 'cust3nameE')
  String? thirdNameEn;
  @JsonKey(name: 'genderCode')
  int? genderCode;
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
  @JsonKey(name: 'nationalityCode')
  int? nationalityCode;
  @JsonKey(name: 'birthDate')
  String? birthDate;
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
  @JsonKey(name: 'comment')
  String? comment;
  @JsonKey(name: 'filled')
  int? filled;

  RegisterBody({
    this.firstNameAr,
    this.secondNameAr,
    this.thirdNameAr,
    this.firstMotherNameAr,
    this.secondMotherNameAr,
    this.thirdMotherNameAr,
    this.firstNameEn,
    this.secondNameEn,
    this.thirdNameEn,
    this.genderCode,
    this.email1,
    this.email2,
    this.telNo1,
    this.telNo2,
    this.addressLine1,
    this.addressLine2,
    this.nationalityCode,
    this.birthDate,
    this.cityCode,
    this.countryNo,
    this.institution,
    this.jobTitle,
    this.experiencesA,
    this.experiencesB,
    this.userAcct,
    this.userPassword,
    this.photo,
    this.comment,
    this.filled,
  });

  factory RegisterBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);
}
