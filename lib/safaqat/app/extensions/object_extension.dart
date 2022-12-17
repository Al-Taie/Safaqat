import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';

extension ObjectExtension on Object? {
  double? toDoubleOrNull() {
    try {
      return this as double;
    } catch (e) {
      return null;
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

extension PlacesSearchResultExtension on PlacesSearchResult {
  Coordinates toCoordinates() => Coordinates(
        geometry?.location.lat,
        geometry?.location.lng,
      );
}


extension CoordinatesExtension on Coordinates {
  String toStr() => '$longitude,$latitude';
}