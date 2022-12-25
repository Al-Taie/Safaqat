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
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/checkbox_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/event_details_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/event_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/edit/edit_event_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/event_map.dart';

class EditEventPage extends StatelessWidget {
  const EditEventPage({
    Key? key,
    required this.event,
  }) : super(key: key);
  final EventDto event;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditEventController());
    controller.event = event;
    controller.loadEvents(event);

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
            AppStrings.editEvent,
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
                          titleInitialValue: controller.titleAr,
                          contentInitialValue: controller.detailsAr,
                          onTitleChange: (String it) {
                            controller.titleAr = it;
                          },
                          onContentChange: (String it) {
                            controller.detailsAr = it;
                          },
                          onTagsChange: (List<String> it) {
                            controller.tagsAr.value = it;
                          },
                          expanded: controller.arabicExpanded.value,
                          onExpansionChanged: (bool it) {
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.arabicExpanded.value = it;
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
                          titleInitialValue: controller.titleEn,
                          contentInitialValue: controller.detailsEn,
                          onTitleChange: (String it) {
                            controller.titleEn = it;
                          },
                          onContentChange: (String it) {
                            controller.detailsEn = it;
                          },
                          onTagsChange: (List<String> it) {
                            controller.tagsEn.value = it;
                          },
                          expanded: controller.englishExpanded.value,
                          onExpansionChanged: (bool it) {
                            controller.arabicExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.englishExpanded.value = it;
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
                          phoneInitialValue: controller.phone,
                          emailInitialValue: controller.email,
                          websiteInitialValue: controller.website,
                          startAtInitialValue: controller.startAt,
                          endAtInitialValue: controller.endAt,
                          cityInitialValue: controller.city.name,
                          countryInitialValue: controller.country.name,
                          cameraPosition:
                              controller.event.coordinates?.toCameraPosition(),
                          onCityChange: (city) {
                            controller.city = city;
                            controller.locationController.setCountryLocation(
                              city: city.name,
                              country: controller.country.name,
                            );
                          },
                          onCountryChange: (it) => controller.country = it,
                          onEmailChange: (it) => controller.email = it,
                          onPhoneChange: (it) => controller.phone = it,
                          onWebsiteChange: (it) => controller.website = it,
                          onStartChange: (it) => controller.startAt = it,
                          onEndChange: (it) => controller.endAt = it,
                          onPressed: (LatLng it) {
                            EventMap(
                              cameraPosition:
                                  controller.locationController.geoLocation !=
                                          null
                                      ? null
                                      : controller.event.coordinates
                                          ?.toCameraPosition(),
                            ).navTo();
                          },
                          expanded: controller.detailsExpanded.value,
                          typeExpaned: controller.typeExpaned.value,
                          attendExpaned: controller.attendExpaned.value,
                          onExpansionChanged: (bool it) {
                            controller.arabicExpanded.value = false;
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = it;
                          },
                          onTypeExpansionChange: (bool it) =>
                              controller.typeExpaned.value = it,
                          onAttendExpansionChange: (bool it) =>
                              controller.attendExpaned.value = it,
                          onTypeChange: (it) => controller.type = it,
                          onAttendChange: (it) => controller.attend = it,
                        );
                      }),
                      const SizedBox(height: 16),
                      // Obx(() {
                      //   return LocalImagesWidget(
                      //     imageController: controller.imageController,
                      //     expanded: controller.imagesExpanded.value,
                      //     onImagesChange: (it) {
                      //       controller.images = it
                      //     },
                      //     onExpansionChanged: (bool it) {
                      //       controller.arabicExpanded.value = false;
                      //       controller.englishExpanded.value = false;
                      //       controller.detailsExpanded.value = false;
                      //       controller.imagesExpanded.value = it
                      //     },
                      //   );
                      // }),
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
                  onPressed: () {
                    controller.targetPlace =
                        controller.locationController.targetPlace;
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
