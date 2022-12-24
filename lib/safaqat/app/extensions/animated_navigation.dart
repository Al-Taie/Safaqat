import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

extension AnimatedNavigation on Widget {
  void navTo({arguments}) {
    Get.to(
      this,
      duration: const Duration(milliseconds: 300),
      transition: Transition.cupertino,
      arguments: arguments,
    );
  }

  void navToReplacement({arguments}) {
    Get.offAll(
      this,
      duration: const Duration(milliseconds: 300),
      transition: Transition.cupertino,
      arguments: arguments,
    );
  }
}
