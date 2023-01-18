import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/drawable.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/animated_navigation.dart';
import 'package:safaqat/safaqat/presentation/custom_views/app_bar_widget.dart';
import 'package:safaqat/safaqat/presentation/custom_views/custom_floating_button.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/add/add_contract_page.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/components/contract_items_widget.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/mine/my_contracts_controller.dart';

class MyContractsPage extends StatelessWidget {
  const MyContractsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyContractsController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: Obx(
              () => CustomFloatingButton(
                title: AppStrings.addNewContract,
                icon: AppDrawable.icAdd,
                isExtended: controller.isFloatingButtonExtended.value,
                onClick: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  const AddContractPage().navTo();
                },
              ),
            ),
            appBar: AppBarWidget(
              width: Get.width,
              onBackPressed: Get.back,
              title: AppStrings.manageContracts,
              onSearch: (String query) =>
                  controller.searchContracts(query),
            ),
            body: Obx(
              () => ContractItemsWidget(
                status: controller.status.value.status,
                apiCall: controller.contracts,
                data: controller.filteredContracts.value,
                isLogged: true,
                onEdit: (value) {
                  // TODO: IMPLEMENT ME
                  // EditContractPage(contract: value).navTo();
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
        ),
      ),
    );
  }
}
