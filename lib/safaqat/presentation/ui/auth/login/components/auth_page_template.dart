import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';

class AuthPageTemplate extends StatelessWidget {
  final String? title;
  final bool showLogo;
  final EdgeInsets padding;
  final String secondaryTitle;
  final List<Widget> children;
  final Alignment alignment;

  const AuthPageTemplate({
    Key? key,
    this.children = const <Widget>[],
    this.title,
    this.showLogo = true,
    this.alignment = Alignment.bottomCenter,
    this.padding = const EdgeInsets.symmetric(horizontal: 42.0, vertical: 28),
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
            showLogo
                ? Align(
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
                  )
                : const SizedBox(),
            Align(
              alignment: alignment,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  showLogo ? const SizedBox()
                  : Container(
                    width: 164,
                    height: 164,
                    decoration: BoxDecoration(
                      border: Border.all(width: 6, color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: SvgPicture.asset(
                        AppDrawable.avatarPlaceholder,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: showLogo? 0 : 36,
                  ),

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
                    padding: padding,
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
