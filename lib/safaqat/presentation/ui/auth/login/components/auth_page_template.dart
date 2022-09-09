import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';

class AuthPageTemplate extends StatelessWidget {
  final String? title;
  final String secondaryTitle;
  final List<Widget> children;

  const AuthPageTemplate({
    Key? key,
    this.children = const <Widget>[],
    this.title,
    required this.secondaryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              AppDrawable.centerBaseLayer,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.87,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.elliptical(100, 15)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: const SizedBox(),
                  ),
                ),
              ),
            ),
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
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title ?? AppStrings.welcomeToSafaqat,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    secondaryTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.ternary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 42.0, vertical: 28),
                    child: Column(
                      children: [...children],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
