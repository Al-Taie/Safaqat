import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dio/dio.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/types.dart';
import 'package:safaqat/safaqat/domain/entities/events/stakeholder.dart';
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

  T? find({required ResultCallback<T, bool> selector}) {
    try {
      return this?.firstWhere((T e) => selector(e));
    } catch (e) {
      return null;
    }
  }

  void forEachIndexed(void Function(int index, T element) action) {
    if (this == null) return;

    for (var index = 0; index < this!.length; index++) {
      action(index, this![index]);
    }
  }
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

class StakeholderMultiPart {
  StakeholderMultiPart({required this.fields, required this.files});

  final List<MapEntry<String, String>> fields;
  final List<MapEntry<String, MultipartFile>> files;
}

extension StakeHoldersExtension on List<Stakeholder?>? {
  StakeholderMultiPart toMultiPart() {
    var fields = <MapEntry<String, String>>[];
    var files = <MapEntry<String, MultipartFile>>[];

    if (this == null) return StakeholderMultiPart(fields: fields, files: files);

    forEachIndexed((index, value) {
      if (value == null) return;

      fields.addAll([
        MapEntry(
          'StakeHolder[$index].stakeholderName',
          value.stakeholderName,
        ),
        MapEntry(
          'StakeHolder[$index].stakeholderOrder',
          value.stakeholderOrder.toString(),
        ),
        MapEntry(
          'StakeHolder[$index].stakeholderType',
          value.stakeholderType.toString(),
        ),
        MapEntry(
          'StakeHolder[$index].sponsorType',
          value.sponsorType,
        ),
      ]);

      files.add(
        MapEntry(
          'StakeHolder[$index].stakeholderLogo',
          MultipartFile.fromFileSync(
            value.stakeholderLogo.path,
            filename:
                value.stakeholderLogo.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    });

    return StakeholderMultiPart(fields: fields, files: files);
  }
}
