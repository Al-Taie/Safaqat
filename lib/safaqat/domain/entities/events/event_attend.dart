import 'package:safaqat/safaqat/app/config/strings.dart';

enum EventAttend {
  onsite,
  online,
  both,
  unspecified;

  @override
  String toString() {
    switch (this) {
      case EventAttend.online:
        return AppStrings.online;
      case EventAttend.onsite:
        return AppStrings.onsite;
      case EventAttend.both:
        return AppStrings.both;
      case EventAttend.unspecified:
        return AppStrings.unspecified;
    }
  }
}
