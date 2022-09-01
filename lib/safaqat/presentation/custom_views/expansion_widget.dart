import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpansionWidget extends StatelessWidget {
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Widget? customHeader;
  final String title;
  final bool isCustomHeader;
  final Color? headerColor;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry? headerContentPadding;
  final BorderRadiusGeometry borderRadius;
  final Color foregroundColor;
  final IconData? icon;

  ExpansionWidget({
    Key? key,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.title = '',
    this.icon,
    this.headerColor,
    this.foregroundColor = Colors.white,
    this.contentPadding = EdgeInsets.zero,
    this.headerContentPadding,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.initiallyExpanded = false,
    this.customHeader,
    this.isCustomHeader = false,
  }) : super(key: key);

  final RxBool _isExpanded = false.obs;

  void _setExpansion(bool shouldBeExpanded) {
    if (shouldBeExpanded != _isExpanded.value) {
      _isExpanded.value = shouldBeExpanded;

      if (onExpansionChanged != null) {
        onExpansionChanged!(_isExpanded.value);
      }
    }
  }

  void toggleExpansion() {
    _setExpansion(!_isExpanded.value);
  }

  @override
  Widget build(BuildContext context) {
    _isExpanded.value = initiallyExpanded;

    return Obx(
      () => Column(
        children: [
          InkWell(
            customBorder: RoundedRectangleBorder(borderRadius: borderRadius),
            onTap: toggleExpansion,
            child: ListTile(
              tileColor: headerColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              contentPadding: headerContentPadding,
              title: isCustomHeader
                  ? customHeader
                  : titleWidget(
                text: title,
                icon: icon,
                color: foregroundColor,
              ),
              trailing: Icon(
                _isExpanded.value ? Icons.expand_less : Icons.expand_more,
                color: foregroundColor,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFBFBFB),
              borderRadius: borderRadius
            ),
            child: ClipRect(
              child: Align(
                heightFactor: _isExpanded.value ? 1 : 0,
                child: Padding(
                  padding: contentPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                      children: children
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget titleWidget({
  required String text,
  IconData? icon,
  required Color color,
}) {
  return Row(
    children: [
      Icon(
        icon,
        color: color,
      ),
      const SizedBox(width: 4),
      Text(
        text,
        style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w700),
      ),
    ],
  );
}
