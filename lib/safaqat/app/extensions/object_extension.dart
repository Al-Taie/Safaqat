import 'dart:ffi';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:safaqat/safaqat/app/config/types.dart';
import 'package:safaqat/safaqat/data/models/events/coordinates_dto.dart';
import 'package:safaqat/safaqat/data/models/posts/post_type_dto.dart';
import 'package:safaqat/safaqat/domain/entities/posts/post_type.dart';

extension ObjectExtension on Object? {
  double? toDoubleOrNull() {
    try {
      return double.tryParse(toString());
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

extension PostTypeDtoExtension on PostTypeDto? {
  PostType? toDomainOrNull() => this?.type == PostType.opportunity.index
      ? PostType.opportunity
      : this?.type == PostType.request.index
          ? PostType.request
          : null;
}

extension RxListExtension<T> on RxList<T> {
  void removeWithUpdate2(RxList<T> list, ResultCallback<T, bool> selector) {
    list.removeWhere((it) => selector(it));
    list.refresh();
    removeWhere((it) => selector(it));
    refresh();
  }

  void removeFromWithUpdate(ResultCallback<T, bool> selector) {
    removeWhere((it) => selector(it));
    refresh();
  }

  void replaceWithUpdate2(
      {required T oldItem, required T newItem, required RxList<T> list}) {
    int listIndex = list.indexOf(oldItem);
    int index = indexOf(oldItem);

    if (listIndex != -1) {
      list.removeAt(listIndex);
      list.insert(listIndex, newItem);
      list.refresh();
    }
    if (index != -1) {
      removeAt(index);
      insert(index, newItem);
      refresh();
    }
  }

  void removeWithUpdate(ResultCallback<T, bool> selector) {
    removeWhere((it) => selector(it));
    refresh();
  }

  void addWithUpdate(T item) {
    add(item);
    refresh();
  }

  void replaceWithUpdate(T item) {
    int index = indexOf(item);
    removeAt(index);
    insert(index, item);
    refresh();
  }
}
