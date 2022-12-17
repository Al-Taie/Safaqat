import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:safaqat/safaqat/app/config/types.dart';
import 'package:safaqat/safaqat/data/models/events/event_coordinates.dart';

extension ObjectExtension on Object? {
  double? toDoubleOrNull() {
    try {
      return this as double;
    } catch (e) {
      return null;
    }
  }
}

extension TExtension<T> on T? {
  T? apply(VoidCallback<T> run) {
    if (this != null) {
      run(this as T);
    }
    return this;
  }

  void let(VoidCallback<T> run) {
    if (this != null) {
      run(this as T);
    }
  }
}

extension GeocodingResultExtension on GeocodingResult? {
  LatLng toLatLng() {
    if (this?.geometry != null) {
      return LatLng(this!.geometry.location.lat, this!.geometry.location.lng);
    }
    return const LatLng(33.223191, 43.679291);
  }

  String? get region => this?.addressComponents.first.shortName;
  Location? get location => this?.geometry.location;
}

extension PlacesSearchResultExtension on PlacesSearchResult? {
  EventCoordinates? toCoordinates() {
    if (this?.geometry?.location != null) {
      EventCoordinates(
        latitude: this?.geometry?.location.lat,
        longitude: this?.geometry?.location.lng,
      );
    }
    return null;
  }
}

extension MarkerExtension on Marker? {
  EventCoordinates? toCoordinates() {
    if (this?.position != null) {
      return EventCoordinates(
        latitude: this?.position.latitude,
        longitude: this?.position.longitude,
      );
    }
    return null;
  }
}
