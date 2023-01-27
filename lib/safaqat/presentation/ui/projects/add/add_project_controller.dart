import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/cost_category_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_body.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_convener_type.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_sector_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/projects/add_project_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/app_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/mine/my_projects_controller.dart';

class AddProjectController extends GetxController {
  final _addProjectUseCase = Get.put(AddProjectUseCase());
  final AppController _appController = Get.find();
  final LocationController locationController = Get.find();
  final MyProjectsController _myProjectsController = Get.find();

  final RxBool detailsExpanded = false.obs;
  final RxBool arabicExpanded = false.obs;
  final RxBool englishExpanded = false.obs;
  final RxBool imagesExpanded = false.obs;
  final RxBool convenerExpanded = false.obs;
  final RxBool sectorExpanded = false.obs;
  final RxBool categoryExpanded = false.obs;
  final RxBool costExpanded = false.obs;

  static const int maxImages = 10;
  static const List<String> allowedImageConvenerTypes = ['png', 'jpg', 'jpeg'];
  final imageController = MultiImagePickerController(
    maxImages: maxImages,
    allowedImageTypes: allowedImageConvenerTypes,
  );

  RxList<PostCategoryDto> get categories => _appController.postCategories;

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  final convenerFormKey = GlobalKey<FormState>();
  final sectorFormKey = GlobalKey<FormState>();
  final categoryFormKey = GlobalKey<FormState>();
  final costFormKey = GlobalKey<FormState>();

  RxList<CountryDto> get countries => _appController.countries;
  RxList<CityDto> get cities => _appController.cities;
  RxList<CostCategoryDto> get costs => _appController.costs;

  CountryDto get country => _appController.country;
  set country(CountryDto value) => _appController.country = value;

  CityDto get city => _appController.city;
  set city(CityDto value) => _appController.city = value;

  final _category = PostCategoryDto().obs;
  PostCategoryDto get category => _category.value;
  set category(PostCategoryDto value) => _category.value = value;

  final _startDate = ''.obs;
  String get startDate => _startDate.value;
  set startDate(String value) => _startDate.value = value;

  final _endDate = ''.obs;
  String get endDate => _endDate.value;
  set endDate(String value) => _endDate.value = value;

  final _actualEndDate = ''.obs;
  String get actualEndDate => _actualEndDate.value;
  set actualEndDate(String value) => _actualEndDate.value = value;

  final _cost = CostCategoryDto().obs;
  CostCategoryDto get cost => _cost.value;
  set cost(CostCategoryDto value) => _cost.value = value;

  final _nameAr = ''.obs;
  String get nameAr => _nameAr.value;
  set nameAr(String value) => _nameAr.value = value;

  final _nameEn = ''.obs;
  String get nameEn => _nameEn.value;
  set nameEn(String value) => _nameEn.value = value;

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

  final _convener = ProjectConvenerType.governmental.obs;
  ProjectConvenerType get convener => _convener.value;
  set convener(ProjectConvenerType value) => _convener.value = value;

  final _sector = ProjectSectorType.agricultural.obs;
  ProjectSectorType get sector => _sector.value;
  set sector(ProjectSectorType value) => _sector.value = value;

  final _instituteAr = ''.obs;
  String get instituteAr => _instituteAr.value;
  set instituteAr(String value) => _instituteAr.value = value;

  final _instituteEn = ''.obs;
  String get instituteEn => _instituteEn.value;
  set instituteEn(String value) => _instituteEn.value = value;

  void publish() async {
    status.value = Resources.loading();

    final ProjectBody body = ProjectBody(
      nameAr: nameAr,
      nameEn: nameEn,
      descriptionAr: detailsAr,
      descriptionEn: detailsEn,
      instituteNameAr: instituteAr,
      instituteNameEn: instituteEn,
      cost: cost.code,
      sector: sector.index,
      startDate: startDate,
      endDate: endDate,
      category: category,
      actualEndDate: actualEndDate,
      showEmail: showEmail,
      showPhone: showPhone,
      convener: convener.index,
      city: city,
      images: images,
      coordinates: locationController.targetPlace?.toCoordinates() ??
          locationController.targetMarker?.toCoordinates(),
    );

    final result = await _addProjectUseCase(params: body);
    status.value = result;

    if (result.status == Status.success) {
      switch (convener) {
        case ProjectConvenerType.governmental:
          _myProjectsController.governmentalProjects
              .addWithUpdate(result.data!);
          break;
        case ProjectConvenerType.private:
          _myProjectsController.privateProjects.addWithUpdate(result.data!);
          break;
        case ProjectConvenerType.mixed:
          _myProjectsController.mixedProjects.addWithUpdate(result.data!);
          break;
        case ProjectConvenerType.foreign:
          _myProjectsController.foreignProjects.addWithUpdate(result.data!);
          break;
        default:
          break;
      }
    }
  }
}
