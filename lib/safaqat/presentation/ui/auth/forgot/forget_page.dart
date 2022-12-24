import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/presentation/custom_views/clickable_text.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_field_filled.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/confirm/confirm_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/forgot/forget_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/components/auth_page_template.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_page.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/guest_main_tabs_page.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetController());
    return AuthPageTemplate(
      secondaryTitle: AppStrings.forgotPassword,
      children: [
        FilledTextField(
          controller: TextEditingController(
            text: Get.arguments?['email'],
          ),
          iconPrefixAsset: null,
          hint: AppStrings.usernameOrPhone,
          onTextChanged: (value) {},
        ),
        const SizedBox(height: 16),
        CustomButton(
          color: AppColors.ternary,
          textColor: AppColors.primaryColor,
          text: AppStrings.sendResetCode,
          onPressed: const ConfirmPage().navTo,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClickableText(
              text: AppStrings.haveAccount,
              onPressed: const LoginPage().navToReplacement,
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
          onPressed: GuestMainTabsPage().navToReplacement,
    ),
      ],
    );
  }
}
