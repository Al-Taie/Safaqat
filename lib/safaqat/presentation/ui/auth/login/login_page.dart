import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/presentation/custom_views/clickable_text.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/forgot/forget_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/components/auth_page_template.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_page.dart';
import 'package:safaqat/safaqat/presentation/ui/home/home_page.dart';

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
    return AuthPageTemplate(
      secondaryTitle: AppStrings.login,
      children: [
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
          isIconSuffix: false,
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
          onPressed: const HomePage().navTo,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClickableText(
              text: AppStrings.forgotPassword,
              onPressed: const ForgetPage().navTo,
            ),
            ClickableText(
              text: AppStrings.dontHaveAccount,
              onPressed: const RegisterPage().navTo,
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
          onPressed: const HomePage().navTo,
        )
      ],
    );
  }
}
