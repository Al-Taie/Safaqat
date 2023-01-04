import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/projects/project_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon2.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/components/text_label.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  final ProjectDto project;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            AppStrings.details,
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
                  project.name,
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
                        text: project.ownerName ?? '-',
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(height: 4),
                      TextIcon(
                        icon: AppDrawable.icDate,
                        text: Utils.formatDate(dateStr: project.postDate),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextIcon(
                        icon: Icons.local_convenience_store_outlined,
                        text: project.convener?.name ?? '-',
                      ),
                      const SizedBox(height: 4),
                      TextIcon(
                        icon: Icons.location_pin,
                        text: project.city?.name ?? '-',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.vertical,
                ),
                itemCount: project.images?.length ?? 0,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  Widget child = ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: project.images?[itemIndex] ?? '',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: AppColors.primaryColor,
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  );

                  return GestureDetector(
                      onTap: () => Get.dialog(child), child: child);
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: Get.width,
                child: Text(
                  project.description,
                  style: AppTextStyle.title
                      .copyWith(fontSize: 14, color: AppColors.shadePrimary),
                ),
              ),
              const SizedBox(height: 16),
              projectInfo(project),
            ],
          ),
        ),
      ),
    );
  }
}

Widget projectInfo(ProjectDto project) {
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
          AppStrings.location,
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
            myLocationEnabled: false,
            onMapCreated: (controller) =>
                controller.animateCamera(project.coordinates!.toCameraUpdate()),
            initialCameraPosition: CameraPosition(
              target: project.coordinates!.toLatLng(),
              zoom: 11,
            ),
            markers: {project.coordinates!.toMarker()},
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        height: 1,
        width: Get.width,
        color: AppColors.shadeQuaternary,
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextIcon2(
            title: AppStrings.startDate,
            icon: Icons.access_time_filled_outlined,
            subTitle: Utils.formatDate(dateStr: project.startDate),
          ),
          Container(
            width: 1,
            height: 60,
            color: AppColors.shadeQuaternary,
          ),
          TextIcon2(
            title: AppStrings.endDate,
            icon: Icons.access_time_filled_outlined,
            subTitle: Utils.formatDate(dateStr: project.endDate),
          ),
          Container(
            width: 1,
            height: 60,
            color: AppColors.shadeQuaternary,
          ),
      TextIcon2(
        title: AppStrings.actualEndDate,
        icon: Icons.access_time_filled_outlined,
        subTitle: Utils.formatDate(dateStr: project.actualEndDate),
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
        text: project.ownerPhone,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.email}:',
        text: project.ownerEmail,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.institute}:',
        text: project.institute,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.convener}:',
        text: project.convener?.name,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.sector}:',
        text: project.sector?.name,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.category}:',
        text: project.category?.name,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.value}:',
        text: '\$${project.cost}',
      ),
      const SizedBox(height: 8),
    ],
  );
}
