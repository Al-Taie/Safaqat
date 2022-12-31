import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_body.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/posts/add_post_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/app_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/mine/my_posts_controller.dart';

class AddPostController extends GetxController {
  final _addPostUseCase = Get.put(AddPostUseCase());
  final AppController _appController = Get.find();
  final LocationController locationController = Get.find();
  final MyPostsController _myPostsController = Get.find();

  final RxBool detailsExpanded = false.obs;
  final RxBool arabicExpanded = false.obs;
  final RxBool englishExpanded = false.obs;
  final RxBool imagesExpanded = false.obs;
  final RxBool typeExpanded = false.obs;
  final RxBool categoryExpanded = false.obs;

  static const int maxImages = 10;
  static const List<String> allowedImageTypes = ['png', 'jpg', 'jpeg'];
  final imageController = MultiImagePickerController(
    maxImages: maxImages,
    allowedImageTypes: allowedImageTypes,
  );

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  final postTypeFormKey = GlobalKey<FormState>();
  final postCategoryFormKey = GlobalKey<FormState>();

  RxList<CountryDto> get countries => _appController.countries;
  RxList<CityDto> get cities => _appController.cities;
  RxList<PostCategoryDto> get categories => _appController.postCategories;

  CountryDto get country => _appController.country;
  set country(CountryDto value) => _appController.country = value;

  CityDto get city => _appController.city;
  set city(CityDto value) => _appController.city = value;

  final _expiryDate = ''.obs;
  String get expiryDate => _expiryDate.value;
  set expiryDate(String value) => _expiryDate.value = value;
  
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

  final _showPhone = false.obs;
  bool get showPhone => _showPhone.value;
  set showPhone(bool value) => _showPhone.value = value;

  final _showEmail = false.obs;
  bool get showEmail => _showEmail.value;
  set showEmail(bool value) => _showEmail.value = value;
  
  final _type = PostType.opportunity.obs;
  PostType get type => _type.value;
  set type(PostType value) => _type.value = value;

  final _category = PostCategoryDto().obs;
  PostCategoryDto get category => _category.value;
  set category(PostCategoryDto value) => _category.value = value;

  final _instituteAr = ''.obs;
  String get instituteAr => _instituteAr.value;
  set instituteAr(String value) => _instituteAr.value = value;

  final _instituteEn = ''.obs;
  String get instituteEn => _instituteEn.value;
  set instituteEn(String value) => _instituteEn.value = value;
  
  void publish() async {
    status.value = Resources.loading();

    final PostBody body = PostBody(
      titleAr: titleAr,
      titleEn: titleEn,
      descriptionAr: detailsAr,
      descriptionEn: detailsEn,
      instituteNameAr: instituteAr,
      instituteNameEn: instituteEn,
      costCode: type.index as bool,
      categoryCode: category.code,
      expiryDate: expiryDate,
      showEmail: showEmail,
      showPhone: showPhone,
      type: type.index as bool,
      city: city,
      images: images,
      coordinates: locationController.targetPlace?.toCoordinates() ??
          locationController.targetMarker?.toCoordinates(),
    );

    final result = await _addPostUseCase(params: body);
    status.value = result;

    if (result.status == Status.success) {
      switch (type) {
        case PostType.opportunity:
          _myPostsController.opportunityPosts.add(result.data!);
          break;
        case PostType.request:
          _myPostsController.requestPosts.add(result.data!);
          break;
      }
    }
  }
}
