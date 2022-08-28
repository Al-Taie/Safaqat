import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double fontSize;
  final Color color;

  const ClickableText({
    Key? key,
    this.onPressed,
    this.fontSize = 11,
    this.color = Colors.white,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
