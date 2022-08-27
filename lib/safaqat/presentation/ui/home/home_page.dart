import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/presentation/ui/splash/splash_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Scaffold(
      body: Container(),
    );
  }
}