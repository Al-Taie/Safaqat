import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';

class TextIcon extends StatelessWidget {
  const TextIcon({
    Key? key,
    this.size = 16,
    this.width = 14,
    this.height = 14,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String? text;
  final dynamic icon;
  final double size, width, height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon is String
            ? SvgPicture.asset(
                icon,
                color: AppColors.shadeSecondary,
                width: width,
                height: height,
              )
            : Icon(icon, color: AppColors.shadeSecondary, size: size),
        const SizedBox(width: 4),
        Text(
          text ?? '-',
          style: AppTextStyle.contentSecondary,
        ),
      ],
    );
  }
}
