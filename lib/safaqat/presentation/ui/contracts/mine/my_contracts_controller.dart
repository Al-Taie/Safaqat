import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/config/strings.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/app/extensions/toast_manager.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_dto.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/contract_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/contracts/delete_contract_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/contracts/get_my_contracts_usecase.dart';

class MyContractsController extends GetxController {
  final GetMyContractsUseCase _getMyContractsUseCase =
      Get.put(GetMyContractsUseCase());
  final DeleteContractUseCase _deleteContractUseCase =
      Get.put(DeleteContractUseCase());

  final scrollController = ScrollController();

  final _isScrollable = false.obs;
  bool get isScrollable => _isScrollable.value;
  set isScrollable(bool value) => _isScrollable.value = value;

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() => _pagination(
          apiCall: getContracts,
          onValueChange: (int value) {
            pageNumber = value;
          },
          scrollController: scrollController,
          pageNumber: pageNumber,
          maxNumberOfPages: _maxNumberOfPages,
        ));

    scrollController.addListener(
        () => _floatingButtonState(scrollController: scrollController));

    getContracts();
  }

  final isFloatingButtonExtended = true.obs;

  var _maxNumberOfPages = 1;

  final _pageNumber = 1.obs;
  int get pageNumber => _pageNumber.value;
  set pageNumber(int value) => _pageNumber.value = value;

  final _contractData = ContractDto().obs;
  ContractDto get contractData => _contractData.value;
  set contractData(ContractDto value) => _contractData.value = value;

  Rx<Resources<dynamic>> status = Resources<dynamic>.init().obs;
  RxList<ContractDto> contracts = <ContractDto>[].obs;
  RxList<ContractDto> filteredContracts = <ContractDto>[].obs;

  void getContracts() async {
    final params = ContractQuery(
      pageNumber: pageNumber,
    );

    status.value = Resources.loading();

    final result = await _getMyContractsUseCase(params: params);
    status.value = result;

    if (result.data?.contracts != null) {
      contracts.value = result.data!.contracts!;
      filteredContracts.value = contracts.value;
    }

    _maxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void _pagination({
    required VoidCallback apiCall,
    required ValueChanged<int> onValueChange,
    required ScrollController scrollController,
    required int pageNumber,
    required int maxNumberOfPages,
  }) {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < maxNumberOfPages)) {
      onValueChange(++pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      onValueChange(--pageNumber);
      isFloatingButtonExtended.value = true;
      apiCall();
    }
  }

  void _floatingButtonState({required ScrollController scrollController}) {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void deleteContracts({String? id}) async {
    Get.back();

    final result = await _deleteContractUseCase(params: id);

    if (result.status != Status.success) {
      AppStrings.deletedFailed.toToast();
      return;
    }

    AppStrings.deletedSuccessfully.toToast();

    contracts.removeWithUpdate2(
      filteredContracts,
      (it) => it.contractId == id,
    );
  }

  void searchContracts(String query) {
    var newFilteredData = <ContractDto>[];
    newFilteredData = contracts.value;
    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();
      filteredContracts.value = newFilteredData;
  }
}
