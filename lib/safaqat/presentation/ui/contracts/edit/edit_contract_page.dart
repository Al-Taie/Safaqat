import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/config/text_style.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/presentation/custom_views/checkbox_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_button.dart';
import 'package:safaqat/safaqat/presentation/custom_views/loading_view.dart';
import 'package:safaqat/safaqat/presentation/custom_views/local_images_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/svg_icon_button.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/add/components/contract_details_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/add/components/contract_info_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/edit/edit_contract_controller.dart';

class EditContractPage extends StatelessWidget {
  const EditContractPage({
    Key? key,
    required this.contract,
  }) : super(key: key);

  final ContractDto contract;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditContractController());
    controller.loadContract(contract);

    controller.status.listen((result) {
      switch (result.status) {
        case Status.success:
          Get.back();
          AppStrings.publishSuccess.toToast();
          break;
        case Status.error:
          AppStrings.publishFailed.toToast();
          break;
        default:
          break;
      }
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            AppStrings.editProject,
            style: AppTextStyle.title.copyWith(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: SvgIconButton(
            icon: AppDrawable.icBack,
            onPressed: Get.back,
          ),
        ),
        body: Stack(
          children: [
            Column(
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
                    children: [
                      Obx(() {
                        return ContractInfoWidget(
                          title: AppStrings.arabic,
                          name: AppStrings.name,
                          content: AppStrings.content,
                          contractor: AppStrings.contractor,
                          rtl: true,
                          nameInitialValue: controller.nameAr,
                          contentInitialValue: controller.detailsAr,
                          contractorInitialValue: controller.contractorAr,
                          onNameChange: (String value) {
                            controller.nameAr = value;
                          },
                          onContentChange: (String value) {
                            controller.detailsAr = value;
                          },
                          onContractorChange: (String value) {
                            controller.contractorAr = value;
                          },
                          expanded: controller.arabicExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.arabicExpanded.value = value;
                          },
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() {
                        return ContractInfoWidget(
                          title: AppStrings.english,
                          name: AppStrings.name,
                          content: AppStrings.content,
                          contractor: AppStrings.contractor,
                          nameInitialValue: controller.nameEn,
                          contentInitialValue: controller.detailsEn,
                          contractorInitialValue: controller.contractorEn,
                          onNameChange: (String value) {
                            controller.nameEn = value;
                          },
                          onContentChange: (String value) {
                            controller.detailsEn = value;
                          },
                          onContractorChange: (String value) {
                            controller.contractorEn = value;
                          },
                          expanded: controller.englishExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = false;
                            controller.englishExpanded.value = value;
                          },
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(() {
                        return ContractDetailsWidget(
                          title: AppStrings.details,
                          services: controller.services.value,
                          startDateInitialValue: controller.startDate,
                          endDateInitialValue: controller.endDate,
                          serviceInitialValue: controller.service,
                          statusInitialValue: controller.contractStatus,
                          currencyInitialValue: controller.currency,
                          costInitialValue: controller.cost,
                          onServiceChange: (value) =>
                              controller.service = value,
                          onCurrencyChange: (value) =>
                              controller.currency = value,
                          onStatusChange: (value) =>
                              controller.contractStatus = value,
                          onStartDateChange: (value) =>
                              controller.startDate = value,
                          onEndDateChange: (value) =>
                              controller.endDate = value,
                          onCostChange: (value) => controller.cost = value,
                          expanded: controller.detailsExpanded.value,
                          statusExpanded:
                              controller.contractStatusExpanded.value,
                          currencyExpanded: controller.currencyExpanded.value,
                          onExpansionChanged: (bool value) {
                            controller.arabicExpanded.value = false;
                            controller.englishExpanded.value = false;
                            controller.imagesExpanded.value = false;
                            controller.detailsExpanded.value = value;
                          },
                          serviceExpanded: controller.serviceExpanded.value,
                          onCurrencyExpansionChange: (bool value) {
                            controller.currencyExpanded.value = value;
                          },
                          onServiceExpansionChange: (bool value) {
                            controller.serviceExpanded.value = value;
                          },
                          onStatusExpansionChange: (bool value) {
                            controller.contractStatusExpanded.value = value;
                          },
                          statusFormKey: controller.contractStatusFormKey,
                          currencyFormKey: controller.currencyFormKey,
                          serviceFormKey: controller.serviceFormKey,
                        );
                      }),
                      const SizedBox(height: 16),
                      Obx(
                        () => CheckBoxWidget(
                          value: controller.showEmail,
                          onChanged: (state) => controller.showEmail = state,
                          title: AppStrings.showEmail,
                        ),
                      ),
                      Obx(
                        () => CheckBoxWidget(
                          value: controller.showPhone,
                          onChanged: (state) => controller.showPhone = state,
                          title: AppStrings.showPhone,
                        ),
                      ),
                      Obx(
                            () => CheckBoxWidget(
                          value: controller.showInPostPage,
                          onChanged: (state) => controller.showInPostPage = state,
                          title: AppStrings.showInPostPage,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  color: AppColors.ternary,
                  textColor: AppColors.primaryColor,
                  text: AppStrings.edit,
                  onPressed: controller.edit,
                ),
              ],
            ),
            Obx(
              () => LoadingView(
                resource: controller.status.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
