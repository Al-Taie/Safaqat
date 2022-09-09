import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';

class TextFiledForm extends StatelessWidget {
  final int? maxLength;
  final Icon? prefixIcon;
  final Color? prefixIconColor;
  final bool readOnly;
  final String? hintText;
  final ValueChanged<String>? onTextChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final TextAlign textAlign;

  const TextFiledForm({
    Key? key,
    this.maxLength,
    this.onTextChanged,
    this.contentPadding,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.prefixIcon,
    this.prefixIconColor,
    this.readOnly = false,
    this.hintText,
    this.textDirection,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onTextChanged,
      readOnly: readOnly,
      textAlign: textAlign,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.hint,
        fillColor: const Color(0xFFF4F4F4),
        filled: true,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
