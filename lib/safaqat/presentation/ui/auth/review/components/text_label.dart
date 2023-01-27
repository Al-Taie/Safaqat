import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';

class TextLabel extends StatelessWidget {
  final dynamic text;
  final String label;
  final double fontSize;
  final bool autoSize;

  const TextLabel({
    Key? key,
    this.fontSize = 14,
    required this.label,
    required this.text,
    this.autoSize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle style = AppTextStyle.contentSecondary.copyWith(
      fontSize: fontSize,
    );
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyle.mediumText.copyWith(fontSize: 14),
        ),
        const SizedBox(width: 16),
        text is Widget
            ? text
            : autoSize
                ? SizedBox(
                    width: Get.width - 160,
                    child: AutoSizeText(
                      text ?? '-',
                      style: style,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  )
                : Text(
                    text?.toString() ?? '-',
                    style: style,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  ),
      ],
    );
  }
}
