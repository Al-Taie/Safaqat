import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String label, text;
  final double fontSize;

  const TextLabel({
    Key? key,
    this.fontSize = 14,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      fontSize: fontSize,
    );
    return Row(
      children: [
        Text(
          label,
          style: style,
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
