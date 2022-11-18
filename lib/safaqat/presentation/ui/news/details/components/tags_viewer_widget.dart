import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';


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
