import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';

class TextIcon extends StatelessWidget {
  const TextIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String icon, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          color: AppColors.shadeSecondary,
          width: 12,
          height: 12,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyle.contentSecondary,
        ),
      ],
    );
  }
}
