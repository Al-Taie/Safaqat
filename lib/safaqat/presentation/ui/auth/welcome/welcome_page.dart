import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/components/auth_page_template.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return AuthPageTemplate(
      showLogo: false,
      alignment: Alignment.center,
      secondaryTitle: AppStrings.accountWillBeActivatedSoon,
      titlePadding: const EdgeInsets.symmetric(horizontal: 16),
      contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: 128,
              color: AppColors.ternary,
              textColor: AppColors.primaryColor,
              text: AppStrings.mainPage,
              onPressed: const HomePage().navTo,
            ),
            CustomButton(
              width: 128,
              color: AppColors.ternary,
              textColor: AppColors.primaryColor,
              text: AppStrings.personalAccount,
              onPressed: const LoginPage().navTo,
            ),
          ],
        ),
        const SizedBox(
          height: 48,
        )
      ],
    );
  }
}
