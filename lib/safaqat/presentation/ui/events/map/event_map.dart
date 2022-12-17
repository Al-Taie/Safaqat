import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMap extends StatelessWidget {
  EventMap({Key? key}) : super(key: key);
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.312805, 44.361488),
    zoom: 10,
  );

  late GoogleMapController _googleMapController;
  final Rx<Marker?> _origin = Rx(null);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('Google Maps'),
            actions: [
              TextButton(
                onPressed: () {
                  if (_origin.value != null) {
                    _googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: _origin.value!.position,
                          zoom: 14.5,
                          tilt: 50.0,
                        ),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: const Text('DEST'),
              )
            ],
          ),
          body: GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin.value != null) _origin.value!,
            },
            onLongPress: _addMarker,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.black,
            onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPosition),
            ),
            child: const Icon(Icons.center_focus_strong),
          ),
        ));
  }

  void _addMarker(LatLng pos) async {
    _origin.value = Marker(
      markerId: const MarkerId('origin'),
      infoWindow: const InfoWindow(title: 'Origin'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: pos,
    );
  }
}
