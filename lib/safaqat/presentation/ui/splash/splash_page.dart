import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/presentation/ui/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              AppDrawable.centerSplashLayer,
              fit: BoxFit.fill,
            ),
            Center(
                child: SvgPicture.asset(
              AppDrawable.centerSplashTitle,
            )),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24.0,
                ),
                child: Image.asset(
                  AppDrawable.topRightSplashLogo,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24.0,
                ),
                child: Image.asset(
                  AppDrawable.bottomLeftSplashLogo,
                  height: 60,
                  width: 164,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
