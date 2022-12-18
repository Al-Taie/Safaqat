

import 'dart:io';

class Stakeholder {
  String stakeholderName;
  int stakeholderOrder;
  int stakeholderType;
  String sponsorType;
  File? stakeholderLogo;

  Stakeholder({
    required this.stakeholderName,
    required this.stakeholderOrder,
    required this.stakeholderType,
    required this.sponsorType,
    this.stakeholderLogo,
  });
}