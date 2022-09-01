import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/presentation/custom_views/clickable_text.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/components/auth_page_template.dart';

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
      secondaryTitle: AppStrings.welcomeToSafaqat,
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
    );
  }
}
