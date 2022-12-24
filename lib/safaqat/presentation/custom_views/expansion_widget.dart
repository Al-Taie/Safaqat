import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/extensions/boolean_extension.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

class ExpansionWidget extends StatelessWidget {
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Widget? customHeader;
  final String title;
  final bool isCustomHeader, expanded;
  final Color? headerColor;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry? headerContentPadding;
  final BorderRadiusGeometry borderRadius;
  final Color foregroundColor;
  final IconData? icon;
  final String iconSvg;

  const ExpansionWidget({
    Key? key,
    this.expanded = false,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.title = '',
    this.icon,
    this.iconSvg = '',
    this.headerColor,
    this.foregroundColor = Colors.white,
    this.contentPadding = EdgeInsets.zero,
    this.headerContentPadding,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.initiallyExpanded = false,
    this.customHeader,
    this.isCustomHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          customBorder: RoundedRectangleBorder(borderRadius: borderRadius),
          onTap: () => onExpansionChanged?.call(expanded.not()),
          child: Stack(
            children: [
              SizedBox(
                height: 42,
                child: ListTile(
                  tileColor: headerColor,
                  isThreeLine: true,
                  subtitle: const Text(''),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: headerContentPadding,
                  title: isCustomHeader
                      ? customHeader
                      : titleWidget(
                          text: title,
                          icon: icon,
                          iconSvg: iconSvg,
                          color: foregroundColor,
                        ),
                ),
              ),
              Align(
                alignment:
                    Utils.isRTL ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 12, right: 16),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    child: SvgPicture.asset(
                      expanded ? AppDrawable.icTopArrow : AppDrawable.icDownArrow,
                      width: 20,
                      height: 20,
                      color: foregroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ClipRect(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 150),
            child: Align(
              heightFactor: expanded ? 1 : 0,
              child: Padding(
                padding: contentPadding,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: children),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget titleWidget({
  required String text,
  IconData? icon,
  String iconSvg = '',
  required Color color,
}) {
  return Row(
    children: [
      icon != null
          ? Icon(
              icon,
              color: color,
            )
          : iconSvg.isNotEmpty
              ? SvgPicture.asset(
                  iconSvg,
                  width: 24,
                  height: 24,
                  color: color,
                )
              : Container(),
      const SizedBox(width: 4),
      Text(
        text,
        style:
            TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w700),
      ),
    ],
  );
}
