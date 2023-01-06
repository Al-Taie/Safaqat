import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/boolean_extension.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_body.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/domain/entities/projects/edit_project_params.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_convener_type.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_sector_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/projects/edit_project_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/app_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/mine/my_projects_controller.dart';

class EditProjectController extends GetxController {
  final _editProjectUseCase = Get.put(EditProjectUseCase());
  final AppController _appController = Get.find();
  final LocationController locationController = Get.find();
  final MyProjectsController _myProjectsController = Get.find();
  ProjectDto project = ProjectDto();

  final RxBool detailsExpanded = false.obs;
  final RxBool arabicExpanded = false.obs;
  final RxBool englishExpanded = false.obs;
  final RxBool imagesExpanded = false.obs;
  final RxBool convenerExpanded = false.obs;
  final RxBool sectorExpanded = false.obs;
  final RxBool categoryExpanded = false.obs;

  RxList<PostCategoryDto> get categories => _appController.postCategories;

  final Rx<Resources> status = Resources.init().obs;

  final convenerFormKey = GlobalKey<FormState>();
  final sectorFormKey = GlobalKey<FormState>();
  final categoryFormKey = GlobalKey<FormState>();

  RxList<CountryDto> get countries => _appController.countries;
  RxList<CityDto> get cities => _appController.cities;

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

  final _cost = ''.obs;
  String get cost => _cost.value;
  set cost(String value) => _cost.value = value;

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

  final _coordinates = CoordinatesDto().obs;
  CoordinatesDto get coordinates => _coordinates.value;
  set coordinates(CoordinatesDto value) => _coordinates.value = value;

  void edit() async {
    status.value = Resources.loading();

    final params = EditProjectParams(
        projectId: project.id,
        body: ProjectBody(
          nameAr: nameAr,
          nameEn: nameEn,
          descriptionAr: detailsAr,
          descriptionEn: detailsEn,
          instituteNameAr: instituteAr,
          instituteNameEn: instituteEn,
          cost: cost.toDoubleOrNull(),
          sector: sector.index,
          startDate: startDate,
          endDate: endDate,
          category: category,
          actualEndDate: actualEndDate,
          showEmail: showEmail,
          showPhone: showPhone,
          convener: convener.index,
          city: city,
          coordinates: locationController.targetPlace?.toCoordinates() ??
              locationController.targetMarker?.toCoordinates(),
        ));

    final result = await _editProjectUseCase(params: params);
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

  void loadProject(ProjectDto? project) {
    project?.let((it) => this.project = it);
    if (project == null) return;

    nameAr = project.nameAr ?? '';
    nameEn = project.nameEn ?? '';
    detailsAr = project.descriptionAr ?? '';
    detailsEn = project.descriptionEn ?? '';
    startDate = project.startDate ?? '';
    endDate = project.endDate ?? '';
    actualEndDate = project.actualEndDate ?? '';
    coordinates = project.coordinates ?? CoordinatesDto();
    showPhone = project.showPhone.isTrue;
    showEmail = project.showEmail.isTrue;
    country = project.country ?? CountryDto();
    city = project.city ?? CityDto();
    cost = project.cost?.toString() ?? '';
    instituteAr = project.instituteNameAr ?? '';
    instituteEn = project.instituteNameEn ?? '';
    project.sector?.let((it) =>
        it.code.let((code) => sector = ProjectSectorType.fromInt(code)));
    project.convener?.let((it) =>
        it.code.let((code) => convener = ProjectConvenerType.fromInt(code)));
    project.category?.let((it) => category = it);
    locationController.targetMarker = project.coordinates?.toMarker();
  }
}
