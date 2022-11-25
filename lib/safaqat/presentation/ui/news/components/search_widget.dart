import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';


class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.hintText,
    this.controller,
    this.onTextChanged,
  });

  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onTextChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFiledForm(
        radius: 25,
        hintText: hintText,
        controller: controller,
          onTextChanged: onTextChanged,
      ),
    );
  }
}
