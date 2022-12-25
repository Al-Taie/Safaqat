import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';

class CustomAutoCompleteField<T> extends StatelessWidget {
  const CustomAutoCompleteField({
    super.key,
    required this.onSelected,
    required this.suggestions,
    required this.controller,
    this.radius = 10.0,
    this.onTextChanged,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.prefixIcon,
    this.prefixIconColor,
    this.hintText,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.onFieldSubmitted,
    this.onEditingComplete,
  });

  final Iterable<Suggestion<T>> suggestions;
  final ValueChanged<T> onSelected;
  final TextEditingController controller;

  final Icon? prefixIcon;
  final Color? prefixIconColor;
  final double radius;
  final String? hintText;
  final ValueChanged<String>? onTextChanged;
  final EdgeInsetsGeometry contentPadding;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<Suggestion<T>>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller,
        textInputAction: TextInputAction.search,
        onSubmitted: (query) async {
          suggestions.find(selector: (it) => it.name == query)?.let((value) {
            onSelected(value.data);
            Get.back();
          });
        },
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        textAlign: textAlign,
        focusNode: focusNode,
        textDirection: textDirection,
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
      ),
      suggestionsCallback: (query) async {
        return suggestions.search(
            selector: (it) => it.data.toString().contains(query));
      },
      itemBuilder: (context, Suggestion<T> suggestion) {
        return Padding(
          padding: contentPadding,
          child: Row(
            children: [
              const Icon(Icons.location_on, color: AppColors.primaryColor),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  suggestion.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 16,
                      ),
                ),
              ),
            ],
          ),
        );
      },
      onSuggestionSelected: (Suggestion<T> suggestion) async {
        onSelected(suggestion.data);
      },
    );
  }
}

class Suggestion<T> {
  Suggestion({required this.name, required this.data});

  final T data;
  final String name;
}
