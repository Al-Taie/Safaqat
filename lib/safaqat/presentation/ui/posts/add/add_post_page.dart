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
import 'package:safaqat/safaqat/domain/entities/posts/post_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/checkbox_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/custom_views/local_images_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/event_map.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/add/add_post_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/add/components/post_details_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/posts/add/components/post_info_widget.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPostController());

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
            AppStrings.addNewPost,
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
                          locationController: controller.locationController,
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
                            const EventMap().navTo();
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
                      const SizedBox(height: 16),
                      Obx(() {
                        return LocalImagesWidget(
                          imageController: controller.imageController,
                          expanded: controller.imagesExpanded.value,
                          onImagesChange: (value) {
                            controller.images = value;
                          },
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.englishExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.imagesExpanded.value = value;
                          },
                        );
                      }),
                      Obx(
                        () => CheckBoxWidget(
                          value: controller.showEmail,
                          onChanged: (state) => controller.showEmail = state,
                          title: AppStrings.showPublisherName,
                        ),
                      ),
                      Obx(
                        () => CheckBoxWidget(
                          value: controller.showPhone,
                          onChanged: (state) => controller.showPhone = state,
                          title: AppStrings.showPublisherName,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  color: AppColors.ternary,
                  textColor: AppColors.primaryColor,
                  text: AppStrings.post,
                  onPressed: controller.publish,
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
