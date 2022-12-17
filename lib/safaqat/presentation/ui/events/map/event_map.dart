import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/location_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/events/map/search_location_field.dart';

class EventMap extends StatelessWidget {
  const EventMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.find();
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.primaryColor,
        title: const Text('Google Maps'),
      ),
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: CameraPosition(
                target: controller.geoLocation.toLatLng(),
                zoom: 17,
              ),
              onMapCreated: (value) => controller.mapController = value,
              markers: {
                if (controller.targetMarker != null) controller.targetMarker!,
              },
              onLongPress: controller.addMarker,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: 128,
                child: Obx(() {
                  return CustomButton(
                    text: 'Select',
                    enabled: controller.targetMarker != null,
                    onPressed: Get.back,
                    height: 50,
                    width: 128,
                  );
                }),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        onPressed: () => Get.dialog(
          LocationSearchField(
            controller: controller,
            onPlaceSelected: (place) async {
              controller.targetPlace = place;

              var location = place.geometry?.location;

              if (location != null) {
                var target = LatLng(
                  location.lat,
                  location.lng,
                );
                controller.addMarker(target, title: place.name);
                await controller.mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: target,
                      zoom: 17,
                    ),
                  ),
                );
              }
            },
          ),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
