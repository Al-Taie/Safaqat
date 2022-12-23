import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/components/tags_widget.dart';

class EventInfoWidget extends StatelessWidget {
  const EventInfoWidget({
    Key? key,
    this.rtl = false,
    required this.title,
    required this.eventTitle,
    required this.content,
    required this.tagsHint,
    required this.tags,
    required this.onTitleChange,
    required this.onContentChange,
    required this.onTagsChange,
    this.titleInitialValue,
    this.contentInitialValue,
    required this.expanded,
    required this.onExpansionChanged,
  }) : super(key: key);

  final String title, eventTitle, content, tagsHint;
  final String? titleInitialValue, contentInitialValue;
  final bool rtl;
  final List<String> tags;
  final bool expanded;
  final ValueChanged<bool> onExpansionChanged;
  final ValueChanged<String> onTitleChange, onContentChange;
  final Function(List<String> value) onTagsChange;

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      expanded: expanded,
      onExpansionChanged: onExpansionChanged,
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: title,
      children: [
        TextFiledForm(
          hintText: eventTitle,
          initialValue: titleInitialValue,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          onTextChanged: onTitleChange,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFiledForm(
            maxLines: 10,
            hintText: AppStrings.content,
            initialValue: contentInitialValue,
            textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
            textAlign: rtl ? TextAlign.right : TextAlign.left,
            onTextChanged: onContentChange,
          ),
        ),
        TagsWidget(
          hint: tagsHint,
          rtl: rtl,
          tags: tags,
        )
      ],
    );
  }
}
