

import 'package:safaqat/safaqat/app/config/strings.dart';

enum ProjectSectorType{
  _,
  services ,
  industrial,
  agricultural;

  static List<ProjectSectorType> get items => values.skip(1).toList();

  @override
  String toString() {
    switch (this) {
      case ProjectSectorType.services:
        return AppStrings.services;
      case ProjectSectorType.industrial:
        return AppStrings.industrial;
      case ProjectSectorType.agricultural:
        return AppStrings.agricultural;
      default:
        return '';
    }
  }
}
