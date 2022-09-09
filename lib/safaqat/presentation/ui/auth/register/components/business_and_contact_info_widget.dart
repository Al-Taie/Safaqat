import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';

class BusinessAndContactInfoWidget extends StatelessWidget {
  const BusinessAndContactInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: AppStrings.businessAndContactInfo,
      iconSvg: AppDrawable.icContact,
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.country,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.city,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.phone,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.anotherPhone,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.email,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.anotherEmail,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.organization,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.jobPosition,
        ),
      ],
    );
  }
}
