import 'package:safaqat/safaqat/app/config/strings.dart';

enum EventStakeHolderType {
  // ignore: unused_field
  _,
  organizer,
  partner,
  sponsor;

  
  
  static List<EventStakeHolderType> get items => values.skip(1).toList(); 

  @override
  String toString() {
    switch (this) {
      case EventStakeHolderType.organizer:
        return AppStrings.organizer;
      case EventStakeHolderType.partner:
        return AppStrings.partner;
      case EventStakeHolderType.sponsor:
        return AppStrings.sponsor;
      default:
        return '';
    }
  }
}
