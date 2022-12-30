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
import 'package:safaqat/safaqat/data/models/posts/post_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/review/components/text_label.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key, required this.post}) : super(key: key);

  final PostDto post;

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
                  (Utils.isRTL ? post.titleAr : post.titleEn) ?? '-',
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
                        text: post.ownerName ?? '-',
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(height: 4),
                      TextIcon(
                        icon: AppDrawable.icDate,
                        text: Utils.formatDate(dateStr: post.postDate),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextIcon(
                        icon: Icons.event_available,
                        text: post.typeName,
                      ),
                      const SizedBox(height: 4),
                      TextIcon(
                        icon: Icons.location_pin,
                        text: post.city?.name ?? '-',
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
                itemCount: post.images?.length ?? 0,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  Widget child = ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: post.images?[itemIndex] ?? '',
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
                  post.description,
                  style: AppTextStyle.title
                      .copyWith(fontSize: 14, color: AppColors.shadePrimary),
                ),
              ),
              const SizedBox(height: 16),
              postInfo(post),
            ],
          ),
        ),
      ),
    );
  }
}

Widget postInfo(PostDto post) {
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
            myLocationEnabled: false,
            onMapCreated: (controller) =>
                controller.animateCamera(post.coordinates!.toCameraUpdate()),
            initialCameraPosition: CameraPosition(
              target: post.coordinates!.toLatLng(),
              zoom: 11,
            ),
            markers: {post.coordinates!.toMarker()},
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
      TextLabel(
        label: '${AppStrings.expiryDate}:',
        text: Utils.formatDate(dateStr: post.expiryDate),
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.phone}:',
        text: post.ownerPhone,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.email}:',
        text: post.ownerEmail,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.institute}:',
        text: post.instituteName,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.category}:',
        text: post.categoryName,
      ),
      const SizedBox(height: 8),
      TextLabel(
        label: '${AppStrings.value}:',
        text: post.costValue,
      ),
      const SizedBox(height: 8),

    ],
  );
}
