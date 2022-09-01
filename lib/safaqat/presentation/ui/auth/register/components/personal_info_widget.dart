import 'package:flutter/material.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: AppStrings.personalInfo,
      icon: Icons.person_outlined,
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.firstName,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.middleName,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.lastName,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.firstName,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.middleName,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.lastName,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.born,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.nationality,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 2,
              child: TextFiledForm(
                hintText: AppStrings.profilePicture,
                prefixIcon: const Icon(Icons.photo_library_outlined),
                prefixIconColor: AppColors.primaryColor,
                readOnly: true,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }
}
