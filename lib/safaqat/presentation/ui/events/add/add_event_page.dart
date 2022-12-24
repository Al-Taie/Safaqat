import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/domain/entities/events/event_stakeholder_type.dart';
import 'package:safaqat/safaqat/domain/entities/events/stakeholder.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/checkbox_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/add_event_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/event_details_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/event_info_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/local_images_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/event_stakeholders_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/event_map.dart';

class AddEventPage extends StatelessWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddEventController());

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
            AppStrings.addNewEvent,
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
                        return EventInfoWidget(
                          title: AppStrings.arabic,
                          eventTitle: AppStrings.title,
                          content: AppStrings.content,
                          tagsHint: AppStrings.tags,
                          tags: controller.tagsAr,
                          rtl: true,
                          onTitleChange: (String value) {
                            controller.titleAr = value;
                          },
                          onContentChange: (String value) {
                            controller.detailsAr = value;
                          },
                          onTagsChange: (List<String> value) {
                            controller.tagsAr.value = value;
                          },
                          expanded: controller.arabicExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.stakeHolderExpanded.value = false;
                            controller.arabicExpanded.value = value;
                          },
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() {
                        return EventInfoWidget(
                          title: AppStrings.english,
                          eventTitle: AppStrings.title,
                          content: AppStrings.content,
                          tagsHint: AppStrings.tags,
                          tags: controller.tagsEn,
                          onTitleChange: (String value) {
                            controller.titleEn = value;
                          },
                          onContentChange: (String value) {
                            controller.detailsEn = value;
                          },
                          onTagsChange: (List<String> value) {
                            controller.tagsEn.value = value;
                          },
                          expanded: controller.englishExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.stakeHolderExpanded.value = false;
                            controller.englishExpanded.value = value;
                          },
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(() {
                        return EventDetailsWidget(
                          eventTypeFormKey: controller.eventTypeFormKey,
                          eventAttendFormKey: controller.eventAttendFormKey,
                          title: AppStrings.details,
                          email: AppStrings.email,
                          phone: AppStrings.phone,
                          website: AppStrings.website,
                          startAt: AppStrings.startAt,
                          endAt: AppStrings.endAt,
                          cities: controller.cities.value,
                          countries: controller.countries.value,
                          locationController: controller.locationController,
                          onCityChange: (city) {
                            controller.city = city;
                            controller.locationController.setCountryLocation(
                              city: city.nameAr.toString(),
                              country: controller.country.nameAr.toString(),
                            );
                          },
                          onCountryChange: (value) =>
                              controller.country = value,
                          onEmailChange: (value) => controller.email = value,
                          onPhoneChange: (value) => controller.phone = value,
                          onWebsiteChange: (value) =>
                              controller.website = value,
                          onStartChange: (value) => controller.startAt = value,
                          onEndChange: (value) => controller.endAt = value,
                          onPressed: (LatLng value) {
                            const EventMap().navTo();
                          },
                          expanded: controller.detailsExpanded.value,
                          typeExpaned: controller.typeExpaned.value,
                          attendExpaned: controller.attendExpaned.value,
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = value;
                          },
                          onTypeExpansionChange: (bool value) =>
                              controller.typeExpaned.value = value,
                          onAttendExpansionChange: (bool value) =>
                              controller.attendExpaned.value = value,
                          onTypeChange: (value) => controller.type = value,
                          onAttendChange: (value) => controller.attend = value,
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(() {
                        controller.stakeholder ??= Stakeholder(
                            stakeholderName: '',
                            stakeholderOrder: 0,
                            stakeholderType: EventStakeHolderType.organizer,
                            sponsorType: '',
                            stakeholderLogo: File(''),
                          );
                        return EventStakeHoldersWidget(
                          title: AppStrings.stakeholders,
                          name: AppStrings.stakeholderName,
                          nameInitialValue:
                              controller.stakeholder?.stakeholderName,
                          sponsorTypeInitialValue:
                              controller.stakeholder?.sponsorType,
                          sponsorType: AppStrings.sponsorType,
                          stakeHolderTypeExpanded:
                              controller.stakeHolderTypeExpanded.value,
                          eventstakeHolderTypeFormKey:
                              controller.eventstakeHolderTypeFormKey,
                          expanded: controller.stakeHolderExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.englishExpanded.value = false;
                            controller.stakeHolderExpanded.value = value;
                            controller.stakeHolderExpanded.value = value;
                          },
                          onStakeHolderTypeExpansionChanged: (bool value) {
                            controller.stakeHolderTypeExpanded.value = value;
                          },
                          onStakeHolderTypeChange:
                              (EventStakeHolderType value) {
                            controller.stakeholder?.stakeholderType = value;
                          },
                          onStakeHolderImageExpansionChanged: (bool value) {},
                          stakeholderImageExpanded:
                              controller.stakeholderImageExpanded.value,
                          stakeholders: controller.stakeholders.value,
                          onStakeHoldersChanged: (value) {
                            controller.stakeholders.value = value;
                            controller.resetSingleImageLoader();
                          },
                          imageController:
                              controller.singleImageController.value,
                          stakeholder: controller.stakeholder,
                          onStakeHolderChange: (Stakeholder? value) {
                            controller.stakeholder = value;
                          },
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
                            controller.stakeHolderExpanded.value = false;
                            controller.imagesExpanded.value = value;
                          },
                        );
                      }),
                      Obx(
                        () => CheckBoxWidget(
                          value: controller.showName,
                          onChanged: (state) => controller.showName = state,
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
