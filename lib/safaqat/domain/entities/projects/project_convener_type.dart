

import 'package:safaqat/safaqat/app/config/strings.dart';

enum ProjectConvenerType{
  _,
  governmental ,
  private,
  mixed,
  foreign;

  static List<ProjectConvenerType> get items => values.skip(1).toList();

  @override
  String toString() {
    switch (this) {
      case ProjectConvenerType.governmental:
        return AppStrings.governmental;
      case ProjectConvenerType.private:
        return AppStrings.private;
      case ProjectConvenerType.mixed:
        return AppStrings.mixed;
      case ProjectConvenerType.foreign:
        return AppStrings.foreign;
      default:
        return '';
    }
  }
}
