import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/clickable_text.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/forgot/forget_page.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/components/auth_page_template.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_page.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/authorized_main_tabs_page.dart';
import 'package:safaqat/safaqat/presentation/ui/main_tabs/guest_main_tabs_page.dart';

import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_field_filled.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    controller.auth.listen((result) {
      switch (result.status) {
        case Status.success:
          AuthorizedMainTabsPage().navToReplacement();
          break;
        case Status.error:
          AppStrings.loginFailed.toToast();
          break;
        default:
          break;
      }
    });

    return Stack(
      children: [
        AuthPageTemplate(
          secondaryTitle: AppStrings.login,
          children: [
            FilledTextField(
              controller: TextEditingController(
                text: Get.arguments?['username'],
              ),
              iconPrefixAsset: null,
              hint: AppStrings.usernameOrPhone,
              onTextChanged: (value) {
                controller.username = value.trim();
              },
            ),
            const SizedBox(
              height: 16
            ),
            FilledTextField(
              isIconSuffix: false,
              isPasswordField: true,
              controller: TextEditingController(
                text: Get.arguments?['password'],
              ),
              iconPrefixAsset: null,
              hint: AppStrings.password,
              onTextChanged: (value) {
                controller.password = value.trim();
              },
            ),
            const SizedBox(
              height: 16
            ),
            CustomButton(
              color: AppColors.ternary,
              textColor: AppColors.primaryColor,
              text: AppStrings.login,
              onPressed: () => controller.login(),
            ),
            const SizedBox(
              height: 8
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
              onPressed: GuestMainTabsPage().navToReplacement,
            )
          ],
        ),
        Obx(
          () => LoadingView(
            resource: controller.auth.value,
          ),
        ),
      ],
    );
  }
}
