import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton({
    Key? key,
    required this.icon,
    this.onPressed
  }) : super(key: key);

  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(8),
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
