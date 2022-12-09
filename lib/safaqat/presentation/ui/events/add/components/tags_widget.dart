import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';

class TagsWidget extends StatelessWidget {
  TagsWidget({
    super.key,
    required this.hint,
    this.rtl = false,
    this.tags = const [],
  });

  final TextEditingController _textEditingController = TextEditingController();
  final List<String> tags;
  final String hint;
  final bool rtl;

  List<Widget> _builder() {
    return tags
        .map(
          (e) => Padding(
            padding: EdgeInsets.only(
              left: rtl ? 0 : 8.0,
              right: rtl ? 8.0 : 0,
            ),
            child: InputChip(
              label: Text(e),
              elevation: 1,
              pressElevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              onDeleted: () {
                tags.remove(e);
              },
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          if (tags.length < 10)
            TextFiledForm(
              controller: _textEditingController,
              hintText: hint,
              textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
              textAlign: rtl ? TextAlign.right : TextAlign.left,
              onFieldSubmitted: (value) {
                tags.add(value);
                _textEditingController.clear();
              },
            ),
          const SizedBox(
            height: 8,
          ),
          Align(
              alignment: rtl ? Alignment.topRight : Alignment.topLeft,
              child: Wrap(children: _builder())),
        ],
      );
    });
  }
}
