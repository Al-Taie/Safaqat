import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:safaqat/safaqat/app/extensions/boolean_extension.dart';
import 'package:safaqat/safaqat/app/extensions/object_extension.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_body.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_dto.dart';
import 'package:safaqat/safaqat/data/models/contract/service_dto.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/contract_status.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/edit_contract_params.dart';
import 'package:safaqat/safaqat/domain/entities/currency_type.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/usecases/contracts/edit_contract_usecase.dart';
import 'package:safaqat/safaqat/presentation/ui/app_controller.dart';
import 'package:safaqat/safaqat/presentation/ui/contracts/mine/my_contracts_controller.dart';

class EditContractController extends GetxController {
  final _editContractUseCase = Get.put(EditContractUseCase());
  final AppController _appController = Get.find();
  final MyContractsController _myContractsController = Get.find();

  ContractDto contract = ContractDto();

  final RxBool detailsExpanded = false.obs;
  final RxBool arabicExpanded = false.obs;
  final RxBool englishExpanded = false.obs;
  final RxBool imagesExpanded = false.obs;
  final RxBool serviceExpanded = false.obs;
  final RxBool contractStatusExpanded = false.obs;
  final RxBool currencyExpanded = false.obs;

  static const int maxImages = 10;
  static const List<String> allowedImageConvenerTypes = ['png', 'jpg', 'jpeg'];
  final imageController = MultiImagePickerController(
    maxImages: maxImages,
    allowedImageTypes: allowedImageConvenerTypes,
  );

  final Rx<Resources> status = Resources.init().obs;
  List<File> images = <File>[];

  final serviceFormKey = GlobalKey<FormState>();
  final contractStatusFormKey = GlobalKey<FormState>();
  final currencyFormKey = GlobalKey<FormState>();

  RxList<ServiceDto> get services => _appController.services;

  final _currency = CurrencyType.dinar.obs;
  CurrencyType get currency => _currency.value;
  set currency(CurrencyType value) => _currency.value = value;

  final _startDate = ''.obs;
  String get startDate => _startDate.value;
  set startDate(String value) => _startDate.value = value;

  final _endDate = ''.obs;
  String get endDate => _endDate.value;
  set endDate(String value) => _endDate.value = value;

  final _cost = ''.obs;
  String get cost => _cost.value;
  set cost(String value) => _cost.value = value;

  final _nameAr = ''.obs;
  String get nameAr => _nameAr.value;
  set nameAr(String value) => _nameAr.value = value;

  final _nameEn = ''.obs;
  String get nameEn => _nameEn.value;
  set nameEn(String value) => _nameEn.value = value;

  final _detailsAr = ''.obs;
  String get detailsAr => _detailsAr.value;
  set detailsAr(String value) => _detailsAr.value = value;

  final _detailsEn = ''.obs;
  String get detailsEn => _detailsEn.value;
  set detailsEn(String value) => _detailsEn.value = value;

  final _showInPostPage = false.obs;
  bool get showInPostPage => _showInPostPage.value;
  set showInPostPage(bool value) => _showInPostPage.value = value;

  final _showPhone = false.obs;
  bool get showPhone => _showPhone.value;
  set showPhone(bool value) => _showPhone.value = value;

  final _showEmail = false.obs;
  bool get showEmail => _showEmail.value;
  set showEmail(bool value) => _showEmail.value = value;

  final _service = ServiceDto().obs;
  ServiceDto get service => _service.value;
  set service(ServiceDto value) => _service.value = value;

  final _contractStatus = ContractStatus.solicitation.obs;
  ContractStatus get contractStatus => _contractStatus.value;
  set contractStatus(ContractStatus value) => _contractStatus.value = value;

  final _contractorAr = ''.obs;
  String get contractorAr => _contractorAr.value;
  set contractorAr(String value) => _contractorAr.value = value;

  final _contractorEn = ''.obs;
  String get contractorEn => _contractorEn.value;
  set contractorEn(String value) => _contractorEn.value = value;

  void edit() async {
    status.value = Resources.loading();

    final body = EditContractParams(
        contractId: contract.contractId,
        body: ContractBody(
          nameAr: nameAr,
          nameEn: nameEn,
          descriptionAr: detailsAr,
          descriptionEn: detailsEn,
          contractorNameAr: contractorAr,
          contractorNameEn: contractorEn,
          value: cost.toDoubleOrNull(),
          // status: contractStatus.index,
          startDate: startDate,
          endDate: endDate,
          currency: currency.index,
          showEmail: showEmail,
          showPhone: showPhone,
          showInPostPage: showInPostPage,
          serviceCode: service.code,
          images: images,
        ));

    final result = await _editContractUseCase(params: body);
    status.value = result;

    if (result.status == Status.success) {
      _myContractsController.contracts.addWithUpdate(result.data!);
    }
  }

  void loadContract(ContractDto? contract) {
    contract?.let((it) => this.contract = it);
    if (contract == null) return;

    nameAr = contract.nameAr ?? '';
    nameEn = contract.nameEn ?? '';
    detailsAr = contract.descriptionAr ?? '';
    detailsEn = contract.descriptionEn ?? '';
    startDate = contract.startDate ?? '';
    endDate = contract.endDate ?? '';
    showPhone = contract.showPhone.isTrue;
    showEmail = contract.showEmail.isTrue;
    // showInPostPage = contract.showInPostPage.isTrue;
    cost = contract.value?.toString() ?? '';
    currency = CurrencyType.fromInt(contract.currency ?? 0);
    contractorAr = contract.contractorAr ?? '';
    contractorEn = contract.contractorEn ?? '';
    contract.service?.let((it) => service = it);
    contract.contractStatus
        ?.let((it) => contractStatus = ContractStatus.fromInt(it));
  }
}
