import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';
import 'package:safaqat/safaqat/presentation/ui/events/public/events_page.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_page.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/components/bottom_nav_bar.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/tabbed_page.dart';
import 'package:safaqat/safaqat/presentation/ui/news/public/news_page.dart';

class GuestMainTabsPage extends StatelessWidget {
  GuestMainTabsPage({Key? key}) : super(key: key);

  final _selectedTabIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final List<TabbedPage> pages = [
      TabbedPage(
        page: const HomePage(),
        label: AppStrings.home,
        icon: AppDrawable.icHome,
      ),
      TabbedPage(
        page: const NewsPage(),
        label: AppStrings.news,
        icon: AppDrawable.icNews,
      ),
      TabbedPage(
        page: const EventsPage(),
        label: AppStrings.events,
        icon: Icons.event,
      ),
      TabbedPage(
        page: const LoginPage(),
        label: AppStrings.login,
        icon: AppDrawable.icLogin,
      )
    ];
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        body: pages[_selectedTabIndex.value].page,
        bottomNavigationBar: BottomNavBar(
          pages: pages,
          selectedTabIndex: _selectedTabIndex.value,
          onTapChanged: (index) {
            _selectedTabIndex.value = index;
          },
        ),
      ),
    );
  }
}
