import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';



class AnimatedTextWidget extends StatelessWidget {
  String text;
  Duration duration;
  Rx<bool> isAnimated;

  AnimatedTextWidget(
    this.text, {
    Key? key,
    this.duration = const Duration(milliseconds: 150),
    required this.isAnimated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSize(
        duration: duration,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isAnimated.value ? 0 : 18,
            color: AppColors.shadePrimary,
          ),
        ),
      ),
    );
  }
}
