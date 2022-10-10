import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/add_news_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/components/tags_widget.dart';

class NewsInfoWidget extends StatelessWidget {
  const NewsInfoWidget({
    Key? key,
    this.rtl = false,
    required this.title,
    required this.newsTitle,
    required this.content,
    required this.tagsHint,
    required this.tags,
    required this.onTitleChange,
    required this.onContentChange,
    required this.onTagsChange,
  }) : super(key: key);

  final String title, newsTitle, content, tagsHint;
  final bool rtl;
  final List<String> tags;
  final ValueChanged<String> onTitleChange, onContentChange;
  final Function(List<String> value) onTagsChange;

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: title,
      children: [
        TextFiledForm(
          hintText: newsTitle,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          onTextChanged: onTitleChange,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.content,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          onTextChanged: onContentChange,
        ),
        const SizedBox(
          height: 8,
        ),
        TagsWidget(
          hint: tagsHint,
          rtl: rtl,
          tags: tags,
        ),
      ],
    );
  }
}
