import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';

class TextIcon extends StatelessWidget {
  const TextIcon({
    Key? key,
    this.size = 16,
    this.width = 14,
    this.height = 14,
    this.autoSize = false,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final String? text;
  final dynamic icon;
  final bool autoSize;
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
        autoSize ?
          SizedBox(
            width: Get.width - 160,
            child: AutoSizeText(
              text ?? '-',
              style: AppTextStyle.contentSecondary,
              overflow: TextOverflow.clip,
              softWrap: true,
            ),
          ) : Text(
            text ?? '-',
            style: AppTextStyle.contentSecondary,
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
      ],
    );
  }
}
