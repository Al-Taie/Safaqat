import 'package:flutter/cupertino.dart';

import 'colors.dart';

class AppTextStyle {
  double fontSize;
  FontWeight fontWeight;
  Color color;

  AppTextStyle(
      {this.fontSize = 14,
        this.fontWeight = FontWeight.w400,
        this.color = AppColors.shadePrimary});

  static const title = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColors.shadePrimary,
  );

  get titleStyle => TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );

  static const contentSecondary = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: AppColors.shadeSecondary,
  );

  static const mediumText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.shadePrimary,
  );

  static const hint = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: AppColors.shadeTernary,
  );

  static var newSuggestionDecoration = BoxDecoration(
    color: AppColors.background,
    border: Border.all(
      color: AppColors.primaryColor, // set border color
      width: 1.0,
    ), // set border width
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ), // set rounded corner radius
  );
}
