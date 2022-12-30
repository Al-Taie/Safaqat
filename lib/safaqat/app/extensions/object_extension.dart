import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:safaqat/safaqat/app/config/types.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';

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
  CoordinatesDto? toCoordinates() {
    if (this?.geometry?.location != null) {
      CoordinatesDto(
        latitude: this?.geometry?.location.lat,
        longitude: this?.geometry?.location.lng,
      );
    }
    return null;
  }
}

extension MarkerExtension on Marker? {
  CoordinatesDto? toCoordinates() {
    if (this?.position != null) {
      return CoordinatesDto(
        latitude: this?.position.latitude,
        longitude: this?.position.longitude,
      );
    }
    return null;
  }
}

extension EventCoordinatesExtension on CoordinatesDto {
  LatLng toLatLng() {
    return LatLng(
      latitude!,
      longitude!,
    );
  }

  Marker toMarker() {
    return Marker(
      markerId: const MarkerId('target'),
      infoWindow: const InfoWindow(title: 'Event Place'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: toLatLng(),
    );
  }

  CameraPosition toCameraPosition() => CameraPosition(
        target: toLatLng(),
        zoom: 11,
      );

  CameraUpdate toCameraUpdate() =>
      CameraUpdate.newCameraPosition(toCameraPosition());
}
