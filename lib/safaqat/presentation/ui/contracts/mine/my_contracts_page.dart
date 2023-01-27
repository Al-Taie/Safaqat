import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/colors.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/add/add_contract_page.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/components/contract_items_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/edit/edit_contract_page.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/mine/my_contracts_controller.dart';

class MyContractsPage extends StatelessWidget {
  const MyContractsPage({
    Key? key,
    required this.projectId,
    this.logged = false,
  }) : super(key: key);

  final bool logged;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyContractsController(projectId: projectId));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        floatingActionButton: logged ? Obx(
              () => CustomFloatingButton(
            title: AppStrings.addNewContract,
            icon: AppDrawable.icAdd,
            isExtended: controller.isFloatingButtonExtended.value,
            onClick: () {
              FocusScope.of(context).requestFocus(FocusNode());
              AddContractPage(projectId: projectId).navTo();
            },
          ),
        )
            : null,
        body: Obx(
          () => ContractItemsWidget(
            status: controller.status.value.status,
            apiCall: controller.contracts,
            data: controller.filteredContracts.value,
            isLogged: logged,
            onEdit: (value) {
              EditContractPage(contract: value).navTo();
            },
            onDelete: (value) {
              controller.deleteContracts(
                id: value.contractId,
              );
            },
            onPressed: (value) {
              controller.contractData = value;
            },
          ),
        ),
      ),
    );
  }
}
