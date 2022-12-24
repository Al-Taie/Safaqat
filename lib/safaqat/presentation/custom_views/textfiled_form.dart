import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';

class TextFiledForm extends StatelessWidget {
  final int? maxLength;
  final Icon? prefixIcon;
  final Color? prefixIconColor;
  final double radius;
  final bool readOnly;
  final String? hintText, initialValue;
  final ValueChanged<String>? onTextChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final GestureTapCallback? onTap;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String? value)? validator;
  final int? maxLines;
  final VoidCallback? onEditingComplete;

  const TextFiledForm({
    Key? key,
    this.maxLength,
    this.radius = 10.0,
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
    this.onTap,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
    this.initialValue,
    this.maxLines = 1,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      onChanged: (value) {
        validator?.call(value) ?? '';
        onTextChanged?.call(value);
      },
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      textAlign: textAlign,
      focusNode: focusNode,
      textDirection: textDirection,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        label: Text(hintText ?? ''),
        labelStyle: AppTextStyle.hint,
        fillColor: const Color(0xFFF4F4F4),
        filled: true,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(radius)),
        enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
