import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final dynamic text;
  final String label;
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
        text is Widget
            ? text
            : Text(
                text?.toString() ?? '',
                style: style,
              ),
      ],
    );
  }
}
