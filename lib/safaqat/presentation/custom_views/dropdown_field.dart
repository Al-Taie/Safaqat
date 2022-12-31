import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/config/types.dart';


class DropdownField<T> extends StatelessWidget {
  const DropdownField({
    super.key,
    required this.onSelected,
    required this.formKey,
    this.prefixIcon,
    this.prefixIconColor,
    this.radius = 10.0,
    this.hint,
    this.initialValue,
    required this.items,
    required this.selector,
    required this.onExpansionChanged, 
    required this.expanded,
  });

  final ValueChanged<T> onSelected;

  final GlobalKey<FormState> formKey;
  final Icon? prefixIcon;
  final Color? prefixIconColor;
  final double radius;
  final String? hint;
  final T? initialValue;
  final List<T> items;
  final ResultCallback<T, String> selector;
  final bool expanded;
  final ValueChanged<bool> onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: DropdownButtonFormField2<T>(
        value: initialValue,
        onMenuStateChange: onExpansionChanged,
        decoration: InputDecoration(
          label: Text(hint ?? ''),
          labelStyle: AppTextStyle.hint,
          isDense: true,
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
        isExpanded: expanded,
        icon: Icon(
          expanded
              ? Icons.arrow_drop_up_outlined
              : Icons.arrow_drop_down_outlined,
          color: AppColors.primaryColor,
        ),
        iconSize: 30,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: items
            .map((item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    selector(item),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select a choice.';
          }
        },
        onChanged: (value) {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          }
        },
        onSaved: (newValue) {
          if (newValue != null) {
            onSelected(newValue);
          }
        },
      ),
    );
  }
}
