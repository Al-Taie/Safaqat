import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton({
    Key? key,
    required this.icon,
    required this.onPressed
  }) : super(key: key);

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
        child: SvgPicture.asset(
          icon,
          color: AppColors.shadeSecondary,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
