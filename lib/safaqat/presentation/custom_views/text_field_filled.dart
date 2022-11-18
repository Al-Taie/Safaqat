// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:get/get.dart';

import '../../app/config/colors.dart';


class FilledTextField extends StatelessWidget {
  final String? iconPrefixAsset, iconSuffixAsset, hint;
  final int? maxLength;
  final TextStyle? style;
  final ValueChanged<String>? onTextChanged;
  late bool isPasswordField, isIconSuffix, isDense;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  FilledTextField({    Key? key,
        this.iconPrefixAsset,
        this.iconSuffixAsset,
        this.hint,
        this.style,
        required this.onTextChanged,
        this.isDense = false,
        this.isPasswordField = false,
        this.contentPadding,
        this.isIconSuffix = false,
        this.keyboardType,
        this.controller,
        this.inputFormatters,
        this.maxLength,
  }) : super(key: key) {
    _obscureText.value = isPasswordField;
  }

  final RxBool _obscureText = false.obs;

  _toggle() => _obscureText.value = !_obscureText.value;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 42,
      child: TextField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: _obscureText.value,
        inputFormatters: inputFormatters,
        style: style,
        decoration: InputDecoration(
            isDense : isDense,
            contentPadding: contentPadding,
            suffixIcon: isIconSuffix
                ? InkWell(
              onTap: _toggle,
              child: Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: isIconSuffix
                    ? Icon(
                  _obscureText.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                )
                    : null,
              ),
            )
                : null,
            prefixIcon: iconPrefixAsset != null
                ? Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: SvgPicture.asset(
                iconPrefixAsset!,
              ),
            )
                : null,
            hintText: hint,
            hintStyle: AppTextStyle.hint,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            filled: true,
            fillColor: AppColors.background),
        onChanged: onTextChanged,
      ),
    );
  }
}
