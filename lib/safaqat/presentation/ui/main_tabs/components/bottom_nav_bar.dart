import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/extensions/list_extension.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/tabbed_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.pages,
    required this.selectedTabIndex,
    required this.onTapChanged,
  }) : super(key: key);

  final List<TabbedPage> pages;
  final int selectedTabIndex;
  final ValueChanged<int> onTapChanged;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: pages.toBottomNavigationBarItems(),
      type: BottomNavigationBarType.shifting,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.shadePrimary,
      currentIndex: selectedTabIndex,
      onTap: onTapChanged,
    );
  }
}
