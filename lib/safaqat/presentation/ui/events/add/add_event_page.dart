import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/add_event_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/event_details_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/event_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/add/components/publish_event_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/event_map.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';

class AddEventPage extends StatelessWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddEventController());
    final LocationController locationController = Get.find();
    final RxBool detailsExpanded = false.obs;
    final RxBool arabicExpanded = false.obs;
    final RxBool englishExpanded = false.obs;
    final RxBool imagesExpanded = false.obs;
    final RxBool typeExpaned = false.obs;
    final RxBool attendExpaned = false.obs;

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
                          expanded: arabicExpanded.value,
                          onExpansionChanged: (bool value) {
                            englishExpanded.value = false;
                            imagesExpanded.value = false;
                            detailsExpanded.value = false;
                            arabicExpanded.value = value;
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
                          expanded: englishExpanded.value,
                          onExpansionChanged: (bool value) {
                            arabicExpanded.value = false;
                            imagesExpanded.value = false;
                            detailsExpanded.value = false;
                            englishExpanded.value = value;
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
                          locationController: locationController,
                          onCityChange: (city) {
                            controller.city = city;
                            locationController.setCountryLocation(
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
                          expanded: detailsExpanded.value,
                          typeExpaned: typeExpaned.value,
                          attendExpaned: attendExpaned.value,
                          onExpansionChanged: (bool value) {
                            arabicExpanded.value = false;
                            englishExpanded.value = false;
                            imagesExpanded.value = false;
                            detailsExpanded.value = value;
                          },
                          onTypeExpansionChange: (bool value) =>
                              typeExpaned.value = value,
                          onAttendExpansionChange: (bool value) =>
                              attendExpaned.value = value,
                          onTypeChange: (value) => controller.type = value,
                          onAttendChange: (value) => controller.attend = value,
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(() {
                        return PublishEventWidget(
                          expanded: imagesExpanded.value,
                          onExpansionChanged: (bool value) {
                            arabicExpanded.value = false;
                            englishExpanded.value = false;
                            detailsExpanded.value = false;
                            imagesExpanded.value = value;
                          },
                        );
                      }),
                    ],
                  ),
                ),
                CustomButton(
                  color: AppColors.ternary,
                  textColor: AppColors.primaryColor,
                  text: AppStrings.post,
                  onPressed: () {
                    controller.targetPlace = locationController.targetPlace;
                    controller.publish();
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
