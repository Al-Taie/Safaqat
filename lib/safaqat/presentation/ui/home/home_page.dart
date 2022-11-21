import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
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
          appBar: AppBar(
            title: Text(
              AppStrings.home,
              style: AppTextStyle.title.copyWith(fontSize: 18),
            ),
            centerTitle: true,
            backgroundColor: AppColors.background,
            elevation: 0,
            // leading: SvgIconButton(
            //   icon: AppDrawable.icBack,
            //   onPressed: Get.back,
            // ),
          ),
          body: Container()),
    );
  }
}
