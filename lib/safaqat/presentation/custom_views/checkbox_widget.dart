import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool value;
  final String title;
  final ValueChanged<bool>? onChanged;

  const CheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (value) {
            onChanged?.call(value == true);
          },
          checkColor: AppColors.primaryColor,
          activeColor: AppColors.ternary,
        ),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: AppColors.shadeSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
