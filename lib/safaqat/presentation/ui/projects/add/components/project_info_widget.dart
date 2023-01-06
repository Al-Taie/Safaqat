import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/news/add/components/tags_widget.dart';

class ProjectInfoWidget extends StatelessWidget {
  const ProjectInfoWidget({
    Key? key,
    this.rtl = false,
    required this.title,
    required this.name,
    required this.content,
    required this.institute,
    required this.onNameChange,
    required this.onContentChange,
    required this.onInstituteChange,
    this.nameInitialValue,
    this.contentInitialValue,
    this.instituteInitialValue,
    required this.expanded,
    required this.onExpansionChanged,
  }) : super(key: key);

  final String title, name, content, institute;
  final String? nameInitialValue, contentInitialValue, instituteInitialValue;
  final bool rtl;
  final bool expanded;
  final ValueChanged<bool> onExpansionChanged;
  final ValueChanged<String> onNameChange, onContentChange, onInstituteChange;

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
          hintText: name,
          initialValue: nameInitialValue,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          onTextChanged: onNameChange,
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
        TextFiledForm(
          hintText: institute,
          initialValue: instituteInitialValue,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          onTextChanged: onInstituteChange,
        ),
      ],
    );
  }
}
