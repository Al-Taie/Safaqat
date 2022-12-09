import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/tabbed_page.dart';

extension ListExtension<T> on List<T>? {
  T? get firstOrNull {
    if (this != null && this?.isNotEmpty == true) {
      return this?.first;
    }
    return null;
  }

  T? getOrNull(int index) {
    try {
      return this![index];
    } catch (e) {
      return null;
    }
  }

  List<T>? getOr(List<T>? value) =>
      (this != null && this!.isNotEmpty) ? this : value;
}

extension TabbedPageExtension on List<TabbedPage> {
  toBottomNavigationBarItems({
    Color activeColor = AppColors.primaryColor,
    Color inactiveColor = const Color(0XFFB8B8D2),
  }) =>
      map((e) {
        var iconWidget = e.icon is String
            ? SvgPicture.asset(e.icon, color: inactiveColor)
            : Icon(e.icon, color: inactiveColor);

        var activeIconWidgeticonWidget = e.icon is String
            ? SvgPicture.asset(e.icon, color: activeColor)
            : Icon(e.icon, color: activeColor);

        return BottomNavigationBarItem(
          icon: iconWidget,
          label: e.label,
          activeIcon: activeIconWidgeticonWidget,
        );
      }).toList();
}
