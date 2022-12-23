import 'dart:io';

import 'package:safaqat/safaqat/domain/entities/events/event_stakeholder_type.dart';

class Stakeholder {
  String stakeholderName;
  int stakeholderOrder;
  EventStakeHolderType stakeholderType;
  String sponsorType;
  File stakeholderLogo;

  Stakeholder({
    required this.stakeholderName,
    required this.stakeholderOrder,
    required this.stakeholderType,
    required this.sponsorType,
    required this.stakeholderLogo,
  });

  @override
  String toString() =>
      'Stakeholder(name=$stakeholderName, order=$stakeholderOrder, type=$stakeholderType, sponsorType=$sponsorType, logo={stakeholderLogo.path})';
}
