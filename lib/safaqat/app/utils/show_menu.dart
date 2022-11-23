import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/utils/utils.dart';

import '../config/strings.dart';

class ShowMenu {
  static Future<void> showPopup({
    required Offset offset,
    required BuildContext context,
    required List<String> menuItems,
    VoidCallback? onEditPressed, onDeletePressed,
  }) async {
    double bigDistance = 180.0;
    double top = offset.dy + 12;
    double smallDistance = 30.0;

    await showMenu(
      context: context,
      color: AppColors.background,
      position: RelativeRect.fromLTRB(
        Utils.isRTL ? smallDistance : bigDistance,
        top,
        Utils.isRTL ? bigDistance : smallDistance,
        0,
      ),
      items: menuItems
          .map((item) => PopupMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      elevation: 16.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ).then<void>((itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == MenuItems.edit) {
        onEditPressed?.call();
      } else if (itemSelected == MenuItems.delete) {
        onDeletePressed?.call();
      }
    });
  }
}

class MenuItems {
  static String delete = AppStrings.delete;
  static String edit = AppStrings.edit;
}
