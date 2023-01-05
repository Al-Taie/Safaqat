import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/data/models/posts/post_category_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/checkbox_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/event_map.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/add/components/post_details_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/add/components/post_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/edit/edit_post_controller.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';

class EditPostPage extends StatelessWidget {
  const EditPostPage({Key? key, required this.post}) : super(key: key);

  final PostDto post;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditPostController());
    controller.loadPost(post);

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
            AppStrings.editPost,
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
                        return PostInfoWidget(
                          title: AppStrings.arabic,
                          postTitle: AppStrings.title,
                          content: AppStrings.content,
                          institute: AppStrings.institute,
                          titleInitialValue: controller.titleAr,
                          contentInitialValue: controller.detailsAr,
                          instituteInitialValue: controller.instituteAr,
                          rtl: true,
                          onTitleChange: (String value) {
                            controller.titleAr = value;
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
                        return PostInfoWidget(
                          title: AppStrings.english,
                          postTitle: AppStrings.title,
                          content: AppStrings.content,
                          institute: AppStrings.institute,
                          titleInitialValue: controller.titleEn,
                          contentInitialValue: controller.detailsEn,
                          instituteInitialValue: controller.instituteEn,
                          onTitleChange: (String value) {
                            controller.titleEn = value;
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
                        return PostDetailsWidget(
                          title: AppStrings.details,
                          expiryDate: AppStrings.expiryDate,
                          cities: controller.cities.value,
                          countries: controller.countries.value,
                          categories: controller.categories.value,
                          cityInitialValue: controller.city.name,
                          countryInitialValue: controller.country.name,
                          expiryDateInitialValue: controller.expiryDate,
                          postTypeInitialValue: controller.type,
                          postCategoryInitialValue: controller.category,
                          locationController: controller.locationController,
                          cameraPosition:
                          controller.post.coordinates?.toCameraPosition(),
                          onCityChange: (city) {
                            controller.city = city;
                            controller.locationController.setCountryLocation(
                              city: city.name,
                              country: controller.country.name,
                            );
                          },
                          onCountryChange: (value) =>
                              controller.country = value,
                          onEndChange: (value) => controller.expiryDate = value,
                          onPressed: (LatLng value) {
                            EventMap(
                              cameraPosition:
                              controller.locationController.geoLocation !=
                                  null
                                  ? null
                                  : controller.post.coordinates
                                  ?.toCameraPosition(),
                            ).navTo();
                          },
                          expanded: controller.detailsExpanded.value,
                          categoryExpanded: controller.categoryExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = value;
                          },
                          onTypeExpansionChange: (bool value) =>
                              controller.typeExpanded.value = value,
                          onCategoryChange: (PostCategoryDto value) {
                            controller.category = value;
                          },
                          onTypeChange: (PostType value) {
                            controller.type = value;
                          },
                          typeExpanded: controller.typeExpanded.value,
                          onCategoryExpansionChange: (bool value) {
                            controller.categoryExpanded.value = value;
                          },
                          postTypeFormKey: controller.postTypeFormKey,
                          postCategoryFormKey: controller.postCategoryFormKey,
                        );
                      }),
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
                  text: AppStrings.edit,
                  onPressed: () {
                    controller
                        .locationController
                        .targetPlace
                        .toCoordinates()
                        ?.let((value) { controller.coordinates = value; });
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
