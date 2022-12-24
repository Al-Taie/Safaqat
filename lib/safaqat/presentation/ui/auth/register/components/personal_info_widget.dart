import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/presentation/custom_views/autocomplete_textfield.dart';
import 'package:safaqat/safaqat/presentation/custom_views/expansion_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/textfiled_form.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/register/register_controller.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();

    return Obx(() => ExpansionWidget(
          headerColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
          title: AppStrings.personalInfo,
          iconSvg: AppDrawable.icPerson,
          expanded: controller.personalExpanded.value,
          onExpansionChanged: (value) {
            controller.personalExpanded.value = value;
            controller.accountCreationExpanded.value = false;
            controller.businessExpanded.value = false;
          },
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextFiledForm(
                    hintText: AppStrings.firstName,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    onTextChanged: (value) {
                      controller.firstNameAr = value;
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 1,
                  child: TextFiledForm(
                    hintText: AppStrings.middleName,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    onTextChanged: (value) {
                      controller.secondNameAr = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextFiledForm(
              hintText: AppStrings.lastName,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              onTextChanged: (value) {
                controller.lastNameAr = value;
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
                    hintText: AppStrings.firstNameEnglish,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    onTextChanged: (value) {
                      controller.firstNameEn = value;
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 1,
                  child: TextFiledForm(
                    hintText: AppStrings.middleNameEnglish,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    onTextChanged: (value) {
                      controller.secondNameEn = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextFiledForm(
              hintText: AppStrings.lastNameEnglish,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              onTextChanged: (value) {
                controller.lastNameEn = value;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            DateTimePicker(
              firstDate: DateTime(1930),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
              dateMask: 'y-MM-dd',
              decoration: InputDecoration(
                label: Text(AppStrings.born),
                labelStyle: AppTextStyle.hint,
                fillColor: const Color(0xFFF4F4F4),
                filled: true,
                prefixIcon: const Icon(Icons.event),
                enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              onChanged: (val) {
                controller.born = val;
              },
              onSaved: (val) {
                if (val != null) controller.born = val;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            AutocompleteTextField<CountryDto>(
              hintText: AppStrings.nationality,
              suggestions: controller.countries,
              displayStringForOption: (country) => country.name,
              onSelected: (value) {
                controller.nationality = value;
              },
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
                  flex: 3,
                  child: TextFiledForm(
                    hintText: AppStrings.profilePicture,
                    onTap: controller.loadPhoto,
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
        ));
  }
}
