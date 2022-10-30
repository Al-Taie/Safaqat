import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/news/main/components/search_button_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.hintText,
    this.controller,
    required this.onPressed, this.onTextChanged,
  });

  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback onPressed;
  final ValueChanged<String>? onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
        flex: 10,
        child: SizedBox(
          height: 50,
          child: TextFiledForm(
            radius: 25,
            hintText: hintText,
            controller: controller,
              onTextChanged: onTextChanged,
          ),
        ),
      ),
      const SizedBox(width: 16),
      Flexible(
        flex: 4,
        child: SearchButtonWidget(
          onPressed: onPressed,
        ),
      ),
    ]);
  }
}
