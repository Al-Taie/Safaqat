import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/checkbox_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';

class AccountCreationAndTermsPolicyWidget extends StatelessWidget {
  const AccountCreationAndTermsPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: AppStrings.accountCreationAndTermsPolicy,
      icon: Icons.contacts_outlined,
      children: [
        TextFiledForm(
          hintText: AppStrings.username,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.password,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.confirmPassword,
        ),
        const SizedBox(
          height: 8,
        ),
        CheckBoxWidget(
          value: false,
          onChanged: (any) => {},
          title: AppStrings.agreeTermsAndPolicy,
        ),
        CheckBoxWidget(
          value: false,
          onChanged: (any) => {},
          title: AppStrings.receiveNewsletters,
        ),
      ],
    );
  }
}
