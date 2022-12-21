import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/int_extension.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/events/event_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/link_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/components/text_label.dart';
import 'package:safaqat/safaqat/presentation/ui/news/details/components/tags_viewer_widget.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  final EventDto event;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            AppStrings.eventDetails,
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                width: Get.width,
                child: Text(
                  (Utils.isRTL ? event.titleAr : event.titleEn) ?? '-',
                  style: AppTextStyle.title,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextIcon(
                        icon: AppDrawable.icName,
                        text: event.ownerName ?? '-',
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(height: 4),
                      TextIcon(
                        icon: AppDrawable.icDate,
                        text: Utils.formatDate(dateStr: event.startDate),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextIcon(
                        icon: Icons.event_available,
                        text: event.type?.toEventType().toString() ?? '-',
                      ),
                      const SizedBox(height: 4),
                      TextIcon(
                        icon: Icons.location_pin,
                        text:
                            event.attendanceType?.toEventAttend().toString() ??
                                '-',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8),
              //   child: Image.network(event.images?.firstOrNull ?? ''),
              // ),
              const SizedBox(height: 16),
              SizedBox(
                width: Get.width,
                child: Text(
                  (Utils.isRTL ? event.detailsAr : event.detailsEn) ?? '-',
                  style: AppTextStyle.title
                      .copyWith(fontSize: 14, color: AppColors.shadePrimary),
                ),
              ),
              const SizedBox(height: 16),
              eventInfo(event),
              const SizedBox(height: 16),
              Container(
                height: 1,
                width: Get.width,
                color: AppColors.shadeQuaternary,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: Get.width,
                child: Text(
                  AppStrings.hashtags,
                  style: AppTextStyle.title.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              TagsViewerWidget(
                tags: Utils.isRTL ? event.tagsAr : event.tagsEn,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget eventInfo(EventDto event) {
  return Column(
    children: [
      Container(
        height: 1,
        width: Get.width,
        color: AppColors.shadeQuaternary,
      ),
      const SizedBox(height: 8),
      SizedBox(
        width: Get.width,
        child: Text(
          AppStrings.eventLocation,
          style: AppTextStyle.title.copyWith(fontSize: 16),
        ),
      ),
      const SizedBox(height: 8),
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 250,
          width: Get.width,
          child: GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            scrollGesturesEnabled: false,
            rotateGesturesEnabled: false,
            onMapCreated: (controller) =>
                controller.animateCamera(event.coordinates!.toCameraUpdate()),
            initialCameraPosition: CameraPosition(
              target: event.coordinates!.toLatLng(),
              zoom: 11,
            ),
            markers: {event.coordinates!.toMarker()},
          ),
        ),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextIcon(
                icon: AppDrawable.icDate,
                text: AppStrings.startAt,
              ),
              const SizedBox(height: 4),
              Text(
                Utils.formatDate(dateStr: event.startDate),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Container(
            height: 40,
            width: 1,
            color: AppColors.shadeQuaternary,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextIcon(
                icon: AppDrawable.icDate,
                text: AppStrings.endAt,
              ),
              const SizedBox(height: 4),
              Text(
                Utils.formatDate(dateStr: event.endDate),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 8),
      Container(
        height: 1,
        width: Get.width,
        color: AppColors.shadeQuaternary,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.phone}:',
        text: event.telephone,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.email}:',
        text: event.email,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.website}:',
        text: LinkWidget(url: event.webSite),
      ),
    ],
  );
}
