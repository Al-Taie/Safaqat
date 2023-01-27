import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_convener_type.dart';
import 'package:safaqat/safaqat/domain/entities/projects/project_sector_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/checkbox_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/event_map.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/add/components/project_details_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/add/components/project_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/projects/edit/edit_project_controller.dart';

class EditProjectPage extends StatelessWidget {
  const EditProjectPage({
    Key? key,
    required this.project,
  }) : super(key: key);

  final ProjectDto project;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProjectController());
    controller.loadProject(project);

    controller.status.listen((result) {
      switch (result.status) {
        case Status.success:
          Get.back();
          AppStrings.publishSuccess.toToast();
          break;
        case Status.error:
          AppStrings.publishFailed.toToast();
          break;
        default:
          break;
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            AppStrings.editProject,
            style: AppTextStyle.title.copyWith(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: SvgIconButton(
            icon: AppDrawable.icBack,
            onPressed: Get.back,
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      16,
                      16,
                      0,
                    ),
                    children: [
                      Obx(() {
                        return ProjectInfoWidget(
                          title: AppStrings.arabic,
                          name: AppStrings.name,
                          content: AppStrings.content,
                          institute: AppStrings.institute,
                          rtl: true,
                          nameInitialValue: controller.nameAr,
                          contentInitialValue: controller.detailsAr,
                          instituteInitialValue: controller.instituteAr,
                          onNameChange: (String value) {
                            controller.nameAr = value;
                          },
                          onContentChange: (String value) {
                            controller.detailsAr = value;
                          },
                          onInstituteChange: (String value) {
                            controller.detailsAr = value;
                          },
                          expanded: controller.arabicExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.arabicExpanded.value = value;
                          },
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() {
                        return ProjectInfoWidget(
                          title: AppStrings.english,
                          name: AppStrings.name,
                          content: AppStrings.content,
                          institute: AppStrings.institute,
                          nameInitialValue: controller.nameEn,
                          contentInitialValue: controller.detailsEn,
                          instituteInitialValue: controller.instituteEn,
                          onNameChange: (String value) {
                            controller.nameEn = value;
                          },
                          onContentChange: (String value) {
                            controller.detailsEn = value;
                          },
                          onInstituteChange: (String value) {
                            controller.detailsEn = value;
                          },
                          expanded: controller.englishExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.englishExpanded.value = value;
                          },
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(() {
                        return ProjectDetailsWidget(
                          title: AppStrings.details,
                          cities: controller.cities.value,
                          countries: controller.countries.value,
                          categories: controller.categories.value,
                          costs: controller.costs.value,
                          startDateInitialValue: controller.startDate,
                          endDateInitialValue: controller.endDate,
                          actualEndDateInitialValue: controller.actualEndDate,
                          categoryInitialValue: controller.category,
                          countryInitialValue: controller.country.name,
                          cityInitialValue: controller.city.name,
                          convenerInitialValue: controller.convener,
                          sectorInitialValue: controller.sector,
                          costInitialValue: controller.cost,
                          locationController: controller.locationController,
                          cameraPosition:
                              controller.coordinates.toCameraPosition(),
                          onCityChange: (city) {
                            controller.city = city;
                            controller.locationController.setCountryLocation(
                              city: city.name,
                              country: controller.country.name,
                            );
                          },
                          onCountryChange: (value) =>
                              controller.country = value,
                          onStartDateChange: (value) =>
                              controller.startDate = value,
                          onEndDateChange: (value) =>
                              controller.endDate = value,
                          onActualEndDateChange: (value) =>
                              controller.actualEndDate = value,
                          onCostChange: (value) => controller.cost = value,
                          onPressed: (LatLng value) {
                            EventMap(
                              cameraPosition: controller
                                          .locationController.geoLocation !=
                                      null
                                  ? null
                                  : controller.coordinates.toCameraPosition(),
                            ).navTo();
                          },
                          expanded: controller.detailsExpanded.value,
                          sectorExpanded: controller.sectorExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = value;
                          },
                          onConvenerExpansionChange: (bool value) =>
                              controller.convenerExpanded.value = value,
                          onSectorChange: (ProjectSectorType value) {
                            controller.sector = value;
                          },
                          onConvenerChange: (ProjectConvenerType value) {
                            controller.convener = value;
                          },
                          onCategoryChange: (PostCategoryDto value) {
                            controller.category = value;
                          },
                          categoryExpanded: controller.categoryExpanded.value,
                          convenerExpanded: controller.convenerExpanded.value,
                          costExpanded: controller.costExpanded.value,
                          onSectorExpansionChange: (bool value) {
                            controller.sectorExpanded.value = value;
                          },
                          onCategoryExpansionChange: (bool value) {
                            controller.categoryExpanded.value = value;
                          },
                          onCostExpansionChange: (bool value) {
                            controller.costExpanded.value = value;
                          },
                          convenerFormKey: controller.convenerFormKey,
                          sectorFormKey: controller.sectorFormKey,
                          categoryFormKey: controller.categoryFormKey,
                          costFormKey: controller.costFormKey,
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(
                        () => CheckBoxWidget(
                          value: controller.showEmail,
                          onChanged: (state) => controller.showEmail = state,
                          title: AppStrings.showEmail,
                        ),
                      ),
                      Obx(
                        () => CheckBoxWidget(
                          value: controller.showPhone,
                          onChanged: (state) => controller.showPhone = state,
                          title: AppStrings.showPhone,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  color: AppColors.ternary,
                  textColor: AppColors.primaryColor,
                  text: AppStrings.post,
                  onPressed: () {
                    controller.locationController.targetMarker
                        .toCoordinates()
                        ?.let((value) {
                      controller.coordinates = value;
                    });
                    controller.edit();
                  },
                ),
              ],
            ),
            Obx(
              () => LoadingView(
                resource: controller.status.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
