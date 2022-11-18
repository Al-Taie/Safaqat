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
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: EdgeInsets.only(
            top: 16,
            bottom: 16,
            right: Utils.isRTL ? 0 : 10,
            left: Utils.isRTL ? 10 : 0
        ),
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
