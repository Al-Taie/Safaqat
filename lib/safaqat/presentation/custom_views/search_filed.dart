import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';

Widget animatedSearchFiled({
  required void Function(String term)? onSearching,
  FocusNode? searchFocusNode,
}) =>
    TextField(
      autofocus: true,
      focusNode: searchFocusNode,
      cursorColor: Colors.grey,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onChanged: onSearching,
      decoration: InputDecoration(
        fillColor: AppColors.background,
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        hintText: AppStrings.search,
      ),
    );
