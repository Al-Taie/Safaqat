import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/presentation/custom_views/clickable_text.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';

import '../../../../app/config/colors.dart';
import '../../../../app/config/drawable.dart';
import '../../../../app/config/strings.dart';
import '../../../custom_views/text_field_filled.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24.0,
                ),
                child: Image.asset(
                  AppDrawable.topRightSplashLogo,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            SvgPicture.asset(
              AppDrawable.centerBaseLayer,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.welcomeToSafaqat,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      AppStrings.registerNewAccount,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.ternary,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    FilledTextField(
                      controller: TextEditingController(
                        text: Get.arguments?['email'],
                      ),
                      iconPrefixAsset: null,
                      hint: AppStrings.usernameOrPhone,
                      onTextChanged: (
                        value,
                      ) {
                        controller.email = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FilledTextField(
                      isIconSuffix: true,
                      isPasswordField: true,
                      controller: TextEditingController(
                        text: Get.arguments?['password'],
                      ),
                      iconPrefixAsset: null,
                      hint: AppStrings.password,
                      onTextChanged: (
                        value,
                      ) {
                        controller.password = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      color: AppColors.ternary,
                      textColor: AppColors.primaryColor,
                      text: AppStrings.login,
                      onPressed: () => null,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClickableText(
                          text: AppStrings.forgotPassword,
                          onPressed: null,
                        ),
                        ClickableText(
                          text: AppStrings.dontHaveAccount,
                          onPressed: null,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SvgPicture.asset(
                        AppDrawable.greenLine,
                        fit: BoxFit.fill,
                      ),
                    ),
                    CustomButton(
                      color: Colors.white,
                      textColor: AppColors.primaryColor,
                      text: AppStrings.enterWithoutRegister,
                      onPressed: () => null,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
