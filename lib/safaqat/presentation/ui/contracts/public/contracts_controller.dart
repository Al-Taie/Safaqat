import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/extensions/widget_extension.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_dto.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_response.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/contract_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/auth/logout/delete_user_info_usecase.dart';
import 'package:safaqat/safaqat/domain/usecases/contracts/get_contracts_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/auth/login/login_page.dart';

class ContractsController extends GetxController {
  final DeleteUserInfoUseCase _logoutUseCase = Get.put(DeleteUserInfoUseCase());
  final GetContractsUseCase _getContractsUseCase = Get.put(GetContractsUseCase());
  final scrollController = ScrollController();

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_pagination);
    scrollController.addListener(_floatingButtonState);
    getContracts();
  }

  final isFloatingButtonExtended = true.obs;

  final _pageNumber = 1.obs;
  var _maxNumberOfPages = 1;

  int get pageNumber => _pageNumber.value;

  set pageNumber(int value) => _pageNumber.value = value;

  final _contractData = ContractDto().obs;
  ContractDto get contractData => _contractData.value;
  set contractData(ContractDto value) => _contractData.value = value;

  Rx<Resources<ContractResponse>> status = Resources<ContractResponse>.init().obs;

  RxList<ContractDto> contracts = <ContractDto>[].obs;
  RxList<ContractDto> filteredContracts = <ContractDto>[].obs;

  final _query = ''.obs;

  String get query => _query.value;

  set query(String value) => _query.value = value;

  void getContracts() async {
    final body = ContractQuery(pageNumber: pageNumber);

    status.value = Resources.loading();

    final result = await _getContractsUseCase(params: body);
    status.value = result;

    if (result.data?.contracts != null) {
      contracts.value = result.data!.contracts!;
      filteredContracts.value = contracts.value;
    }
    _maxNumberOfPages = result.data?.numberOfPages ?? 1;
  }

  void searchContracts(String query) {
    List<ContractDto> newFilteredData = contracts.value;

    newFilteredData =
        newFilteredData.where((e) => e.toString().contains(query)).toList();

    filteredContracts.value = newFilteredData;
  }

  void _pagination() {
    if (scrollController.position.isMaxScroll &&
        (pageNumber < _maxNumberOfPages)) {
      pageNumber++;
      isFloatingButtonExtended.value = true;
      getContracts();
    } else if (scrollController.position.isMinScroll && pageNumber > 1) {
      pageNumber--;
      isFloatingButtonExtended.value = true;
      getContracts();
    }
  }

  void _floatingButtonState() {
    if (scrollController.position.isMinScroll) {
      isFloatingButtonExtended.value = true;
    } else {
      isFloatingButtonExtended.value = false;
    }
  }

  void logout() {
    _logoutUseCase();
    Get.offAll(() => const LoginPage());
  }
}
