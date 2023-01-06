import 'package:safaqat/safaqat/app/config/strings.dart';

enum ProjectConvenerType {
  _,
  governmental,
  private,
  mixed,
  foreign;

  static List<ProjectConvenerType> get items => values.skip(1).toList();
  String get name => toString();

  static ProjectConvenerType fromInt(int index) {
    if (index == ProjectConvenerType.governmental.index) {
      return ProjectConvenerType.governmental;
    } else if (index == ProjectConvenerType.private.index) {
      return ProjectConvenerType.private;
    } else if (index == ProjectConvenerType.mixed.index) {
      return ProjectConvenerType.mixed;
    } else if (index == ProjectConvenerType.private.index) {
      return ProjectConvenerType.private;
    }
    return ProjectConvenerType._;
  }

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
