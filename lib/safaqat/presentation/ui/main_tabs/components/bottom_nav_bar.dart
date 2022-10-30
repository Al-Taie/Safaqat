import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.pages,
    required this.selectedTabIndex,
    required this.onTapChanged,
  }) : super(key: key);

  final List pages;
  final int selectedTabIndex;
  final ValueChanged<int> onTapChanged;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: pages
          .map(
            (e) => BottomNavigationBarItem(
              icon: SvgPicture.asset(e.iconAssets),
              label: e.label,
              activeIcon: SvgPicture.asset(
                e.iconAssets,
                color: AppColors.primaryColor,
              ),
            ),
          )
          .toList(),
      type: BottomNavigationBarType.shifting,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.shadePrimary,
      currentIndex: selectedTabIndex,
      onTap: onTapChanged,
    );
  }
}
