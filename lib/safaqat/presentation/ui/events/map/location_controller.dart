import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/utils/logger.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';


class LocationController extends GetxController {
  final Rx<PlacesSearchResult?> _targetPlace = Rx(null);
  PlacesSearchResult? get targetPlace => _targetPlace.value;
  set targetPlace(PlacesSearchResult? value) => _targetPlace.value = value;

  late GoogleMapController mapController;
  late GoogleMapController smallMapController;

  final Rx<Marker?> _targetMarker = Rx(null);
  Marker? get targetMarker => _targetMarker.value;
  set targetMarker(Marker? value) => _targetMarker.value = value;

  static const _apiKey = 'AIzaSyD2cuom9RdRHK04VTP8wltYqT2GXfcvLVw';

  final _places = GoogleMapsPlaces(apiKey: _apiKey);

  final _geocode = GoogleMapsGeocoding(apiKey: _apiKey);

  var searchResults = <PlacesSearchResult>[];

  final Rx<GeocodingResult?> _geoLocation = Rx(null);
  GeocodingResult? get geoLocation => _geoLocation.value;
  set geoLocation(GeocodingResult? value) => _geoLocation.value = value;

  void placeSearch({required String query}) async {
    var response = await _places.searchByText(
      query,
      language: Utils.isRTL ? 'ar' : 'en',
      region: geoLocation.region,
      location: geoLocation.location,
    );
    searchResults = response.results;
  }

  PlacesSearchResult? findInSearchResults(String query) {
    try {
      return searchResults.firstWhere((e) => e.name.contains(query));
    } catch (e) {
      return null;
    }
  }

  void addMarker(LatLng pos, {String? title}) async {
    targetMarker = Marker(
      markerId: const MarkerId('target'),
      infoWindow: InfoWindow(title: title),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: pos,
    );

    var update = CameraUpdate.newCameraPosition(
      CameraPosition(
        target: pos,
        zoom: 17,
      ),
    );
    try {
      smallMapController.animateCamera(update);
      mapController.animateCamera(update);
    } catch (e) {}
  }

  void setCountryLocation({
    required String city,
    required String country,
  }) async {
    var response = await _geocode.searchByComponents([
      Component('locality', city),
      Component('country', country),
    ]);

    geoLocation = response.results.first;

    var update = CameraUpdate.newCameraPosition(
      CameraPosition(
        target: geoLocation.toLatLng(),
        zoom: 17,
      ),
    );

    try {
      smallMapController.animateCamera(update);
      mapController.animateCamera(update);
    } catch (e) {}
  }
}
