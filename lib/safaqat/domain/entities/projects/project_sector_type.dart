

import 'package:safaqat/safaqat/app/config/strings.dart';

enum ProjectSectorType{
  _,
  services ,
  industrial,
  agricultural;

  static List<ProjectSectorType> get items => values.skip(1).toList();
  String get name => toString();

  static ProjectSectorType fromInt(int index) {
    if (index == ProjectSectorType.services.index) {
      return ProjectSectorType.services;
    } else if (index == ProjectSectorType.industrial.index) {
      return ProjectSectorType.industrial;
    } else if (index == ProjectSectorType.agricultural.index) {
      return ProjectSectorType.agricultural;
    }
    return ProjectSectorType._;
  }

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
