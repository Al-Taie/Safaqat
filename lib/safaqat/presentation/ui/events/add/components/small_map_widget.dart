import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/boolean_extension.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';

class SmallMapWidget extends StatelessWidget {
  const SmallMapWidget({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
    required this.onPressed,
    this.cameraPosition,
  });
  final LocationController controller;
  final double width, height;
  final ValueChanged<LatLng> onPressed;
  final CameraPosition? cameraPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            if (Utils.isRTL)
              const Icon(Icons.location_pin, color: AppColors.primaryColor),
            Text(AppStrings.selectPlace),
            if (Utils.isRTL.not())
              const Icon(Icons.location_pin, color: AppColors.primaryColor),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: width,
          height: height,
          child: Obx(() {
            return GoogleMap(
              onTap: onPressed,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              scrollGesturesEnabled: false,
              rotateGesturesEnabled: false,
              onMapCreated: (value) => controller.smallMapController = value,
              initialCameraPosition: cameraPosition ??
                  CameraPosition(
                    target: controller.geoLocation.toLatLng(),
                    zoom: 5,
                  ),
              markers: {
                if (controller.targetMarker != null) controller.targetMarker!,
              },
            );
          }),
        ),
      ],
    );
  }
}
