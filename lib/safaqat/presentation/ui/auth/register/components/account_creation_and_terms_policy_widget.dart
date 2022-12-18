import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/checkbox_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';

class AccountCreationAndTermsPolicyWidget extends StatelessWidget {
  const AccountCreationAndTermsPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();

    return Obx(() => ExpansionWidget(
          headerColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
          title: AppStrings.accountCreationAndTermsPolicy,
          iconSvg: AppDrawable.icCheekMark,
          expanded: controller.accountCreationExpanded.value,
          onExpansionChanged: (value) =>
              controller.accountCreationExpanded.value = value,
          children: [
            TextFiledForm(
              hintText: AppStrings.username,
              onTextChanged: (value) {
                controller.username = value;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFiledForm(
              hintText: AppStrings.password,
              // validator: controller.passwordValidator,
              onTextChanged: (value) {
                controller.password = value;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFiledForm(
              hintText: AppStrings.confirmPassword,
              onTextChanged: (value) {
                controller.confirmPassword = value;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => CheckBoxWidget(
                value: controller.agreeTerms,
                onChanged: (state) => {controller.agreeTerms = (state == true)},
                title: AppStrings.agreeTermsAndPolicy,
              ),
            ),
            Obx(
              () => CheckBoxWidget(
                value: controller.receiveNewsletters,
                onChanged: (state) =>
                    {controller.receiveNewsletters = (state == true)},
                title: AppStrings.receiveNewsletters,
              ),
            ),
          ],
        ));
  }
}
