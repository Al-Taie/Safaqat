import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/tabbed_page.dart';

import '../home/home_page.dart';

class MainTabsPage extends StatefulWidget {
  const MainTabsPage({Key? key}) : super(key: key);

  @override
  State<MainTabsPage> createState() => _MainTabsPageState();
}

class _MainTabsPageState extends State<MainTabsPage> {
  int _selectedTabIndex = 0;
  final List<TabbedPage> _pages = [
    TabbedPage(
      page: const HomePage(),
      label: AppStrings.home,
      iconAssets: AppDrawable.icTabHome,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedTabIndex].page),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _pages
          .map((e) => BottomNavigationBarItem(
        icon: SvgPicture.asset(
          e.iconAssets,
        ),
        label: e.label,
        activeIcon: SvgPicture.asset(
          e.iconAssets,
          color: AppColors.primaryColor,
        ),
      ))
          .toList(),
      type: BottomNavigationBarType.shifting,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.shadePrimary,
      currentIndex: _selectedTabIndex,
      onTap: (value) {
        _selectedTabIndex = value;
        setState(
              () {},
        );
      },
    );
  }
}
