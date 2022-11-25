import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBarWidget(
          width: Get.width,
          title: AppStrings.profile,
        ),
        body: Center(
          child: SvgPicture.asset(AppDrawable.develop),
        ),
      ),
    );
  }
}
