import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';

class TextIcon2 extends StatelessWidget {
  const TextIcon2({
    Key? key,
    this.title,
    this.subTitle,
    this.icon,
  }) : super(key: key);
  final String? title, subTitle;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextIcon(
          text: title,
          icon: icon,
          size: 20,
        ),
        const SizedBox(height: 5),
        Text(subTitle ?? '-')
      ],
    );
  }
}
