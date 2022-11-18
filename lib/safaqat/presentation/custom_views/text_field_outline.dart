import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';

import '../../app/config/colors.dart';



// ignore: must_be_immutable
class OutlineTextField extends StatelessWidget {
  final String? iconPrefixAsset, hint;
  final int? maxLength;
  final ValueChanged<String>? onTextChanged;
  late bool isPasswordField, isIconSuffix;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  OutlineTextField({
    Key? key,
    this.iconPrefixAsset,
    this.hint,
    required this.onTextChanged,
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
  Widget build(
      BuildContext context,
      ) {
    return Obx(
          () => TextField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: _obscureText.value,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
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
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.shadeSecondary,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                4,
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.shadeSecondary,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                4,
              ),
            ),
          ),
          hintText: hint,
          hintStyle: AppTextStyle.hint,
        ),
        onChanged: onTextChanged,
      ),
    );
  }
}
