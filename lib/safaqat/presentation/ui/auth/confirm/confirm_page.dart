import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/clickable_text.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/text_field_filled.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/confirm/confirm_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/components/auth_page_template.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConfirmController());
    return AuthPageTemplate(
      secondaryTitle: AppStrings.pleaseWriteConfirmCode,
      children: [
        FilledTextField(
          controller: TextEditingController(
            text: Get.arguments?['confirmCode'],
          ),
          iconPrefixAsset: null,
          hint: AppStrings.confirmCode,
          onTextChanged: (
              value,
              ) {},
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClickableText(
              text: AppStrings.resend,
              onPressed: null,
            ),
            ClickableText(
              text: '6:00',
              onPressed: null,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
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
        ClickableText(
          text: AppStrings.cancelAndReturnToLogin,
          onPressed: null,
        ),
      ],
    );
  }
}
