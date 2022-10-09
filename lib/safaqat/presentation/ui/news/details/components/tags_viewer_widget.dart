import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';
import 'package:safaqat/safaqat/data/models/news/news_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_icon.dart';


class TagsViewerWidget extends StatelessWidget {
  const TagsViewerWidget({
    Key? key,
    this.tags,
  }) : super(key: key);
  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = tags
        ?.map((e) => Padding(
      padding: EdgeInsets.only(
        left: Utils.isRTL ? 0 : 8.0,
        right: Utils.isRTL ? 8.0 : 0,
      ),
      child: Chip(
        label: Text(e),
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    ))
        .toList() ??
        [];

    return Align(
      alignment: Utils.isRTL ? Alignment.topRight : Alignment.topLeft,
      child: Wrap(
        children: chips,
      ),
    );
  }
}
