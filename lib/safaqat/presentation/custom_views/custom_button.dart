import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';


class CustomButton extends StatelessWidget {
  String text;
  final double height, width, radius, fontSize;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Widget? iconWidget;
  final Color color;
  final Color textColor;

  CustomButton({
    Key? key,
    this.text = 'Button',
    this.height = 56,
    this.width = 312,
    this.onPressed,
    this.radius = 8.0,
    this.fontSize = 16.0,
    this.isEnabled = true,
    this.color = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.iconWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        onSurface: isEnabled ? null : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        minimumSize: Size(
          width,
          height,
        ),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Row(
        mainAxisAlignment: (iconWidget != null)
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          if (iconWidget != null) iconWidget!,
          if (iconWidget != null)
            const SizedBox(
              width: 8,
            ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
