import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/autocomplete_textfield.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';

class BusinessAndContactInfoWidget extends StatelessWidget {
  const BusinessAndContactInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return ExpansionWidget(
      headerColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(10),
      title: AppStrings.businessAndContactInfo,
      iconSvg: AppDrawable.icContact,
      children: [
        AutocompleteTextField<CountryDto>(
          hintText: AppStrings.country,
          suggestions: controller.countries,
          displayStringForOption: (country) => country.name,
          onSelected: (value) {
            controller.country = value;
            controller.getCities();
          },
        ),
        const SizedBox(
          height: 8,
        ),
        AutocompleteTextField<CityDto>(
          hintText: AppStrings.city,
          suggestions: controller.cities,
          displayStringForOption: (city) => city.name,
          onSelected: (value) {
            controller.city = value;
          },
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
                keyboardType: TextInputType.phone,
                onTextChanged: (value) {
                  controller.phone = value;
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.anotherPhone,
                keyboardType: TextInputType.phone,
                onTextChanged: (value) {
                  controller.anotherPhone = value;
                },
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
                keyboardType: TextInputType.emailAddress,
                onTextChanged: (value) {
                  controller.email = value;
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: TextFiledForm(
                hintText: AppStrings.anotherEmail,
                keyboardType: TextInputType.emailAddress,
                onTextChanged: (value) {
                  controller.anotherEmail = value;
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.organization,
          onTextChanged: (value) {
            controller.organization = value;
          },
        ),
        const SizedBox(
          height: 8,
        ),
        TextFiledForm(
          hintText: AppStrings.jobPosition,
          onTextChanged: (value) {
            controller.jobPosition = value;
          },
        ),
      ],
    );
  }
}
