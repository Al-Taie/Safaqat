import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../app/config/colors.dart';

import '../../../../app/config/drawable.dart';
import '../../../../app/config/strings.dart';
import '../../../../app/config/text_style.dart';
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 64,),
                  Text(
                    AppStrings.home,
                    style: AppTextStyle.title,
                  ),
                  Text(
                    AppStrings.forgotPassword,
                    style: AppTextStyle.contentSecondary,
                  ),

                  const SizedBox(height: 32,),
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
                  const SizedBox(height: 16,),
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
                  const SizedBox(height: 16,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
