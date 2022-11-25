import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.isLogged = false}) : super(key: key);

  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBarWidget(
          width: Get.width,
          title: AppStrings.home,
        ),
        body: Center(
          child: SvgPicture.asset(AppDrawable.develop),
        ),
      ),
    );
  }
}
