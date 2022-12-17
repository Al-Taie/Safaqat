import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';

class AutocompleteTextField<T extends Object> extends StatelessWidget {
  const AutocompleteTextField({
    super.key,
    required this.suggestions,
    required this.displayStringForOption,
    this.optionsMaxHeight = 200.0,
    this.maxOptionsWidth,
    this.hintText,
    this.onTextChanged,
    this.onSelected,
  });

  final String? hintText;
  final List<T> suggestions;
  final AutocompleteOnSelected<T>? onSelected;
  final ValueChanged<String>? onTextChanged;
  final AutocompleteOptionToString<T> displayStringForOption;
  final double optionsMaxHeight;
  final double? maxOptionsWidth;

  Widget _defaultFieldViewBuilder(
      BuildContext context,
      TextEditingController textEditingController,
      FocusNode focusNode,
      VoidCallback onFieldSubmitted) {
    return TextFiledForm(
      focusNode: focusNode,
      hintText: hintText,
      onTextChanged: onTextChanged,
      controller: textEditingController,
      onFieldSubmitted: (value) {
        onFieldSubmitted();
      },
    );
  }

  Widget _defaultOptionsViewBuilder(BuildContext context,
      AutocompleteOnSelected<T> onSelected, Iterable<T> options) {
    return _AutocompleteOptions<T>(
      displayStringForOption: displayStringForOption,
      onSelected: onSelected,
      options: options,
      maxOptionsHeight: optionsMaxHeight,
      maxOptionsWidth:
          maxOptionsWidth ?? (MediaQuery.of(context).size.width) - 52,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      displayStringForOption: displayStringForOption,
      fieldViewBuilder: _defaultFieldViewBuilder,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return Iterable<T>.empty();
        }
        return suggestions.where((T option) {
          return option
              .toString()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      optionsViewBuilder: _defaultOptionsViewBuilder,
      onSelected: (option) {
        FocusScope.of(context).unfocus();
        onSelected?.call(option);
      },
    );
  }
}

class _AutocompleteOptions<T extends Object> extends StatelessWidget {
  const _AutocompleteOptions({
    super.key,
    required this.displayStringForOption,
    required this.onSelected,
    required this.options,
    required this.maxOptionsHeight,
    required this.maxOptionsWidth,
  });

  final AutocompleteOptionToString<T> displayStringForOption;

  final AutocompleteOnSelected<T> onSelected;

  final Iterable<T> options;
  final double maxOptionsHeight, maxOptionsWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: maxOptionsHeight, maxWidth: maxOptionsWidth),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final T option = options.elementAt(index);
              return InkWell(
                onTap: () {
                  onSelected(option);
                },
                child: Builder(builder: (BuildContext context) {
                  final bool highlight =
                      AutocompleteHighlightedOption.of(context) == index;
                  if (highlight) {
                    SchedulerBinding.instance
                        .addPostFrameCallback((Duration timeStamp) {
                      Scrollable.ensureVisible(context, alignment: 0.5);
                    });
                  }
                  return Container(
                    color: highlight ? Theme.of(context).focusColor : null,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(displayStringForOption(option)),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
