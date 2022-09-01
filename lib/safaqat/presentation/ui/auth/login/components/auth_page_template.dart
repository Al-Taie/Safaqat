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
          children: [
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
            SvgPicture.asset(
              AppDrawable.centerBaseLayer,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title ?? AppStrings.welcomeToSafaqat,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      secondaryTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.ternary,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ...children
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
