import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';

class AuthPageTemplate extends StatelessWidget {
  final String? title;
  final bool showLogo;
  final EdgeInsets contentPadding, titlePadding;
  final String secondaryTitle;
  final List<Widget> children;
  final Alignment alignment;

  const AuthPageTemplate({
    Key? key,
    this.children = const <Widget>[],
    this.title,
    this.showLogo = true,
    this.alignment = Alignment.bottomCenter,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 42.0, vertical: 28),
    this.titlePadding = EdgeInsets.zero,
    required this.secondaryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: contentPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppDrawable.topRightSplashLogo,
                  height: 100,
                  width: 100,
                ),
                Text(
                  title ?? AppStrings.welcomeToSafaqat,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  secondaryTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColors.ternary,
                  ),
                ),
                const SizedBox(height: 16),
                ...children,
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
