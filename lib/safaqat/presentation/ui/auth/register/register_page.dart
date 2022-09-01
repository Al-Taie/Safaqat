import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/components/account_creation_and_terms_policy_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/components/business_and_contact_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/components/personal_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  16,
                  16,
                  16,
                  0,
                ),
                children: const [
                  PersonalInfoWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  BusinessAndContactInfoWidget(),
                  SizedBox(
                    height: 16,
                  ),
                  AccountCreationAndTermsPolicyWidget(),
                ],
              ),
            ),
            CustomButton(
              color: AppColors.ternary,
              textColor: AppColors.primaryColor,
              text: AppStrings.reviewInfoAndRegister,
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
