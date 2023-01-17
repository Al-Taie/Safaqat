import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_dto.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/edit_contract_params.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class EditContractUseCase extends ParamUseCase<Resources<ContractDto>, EditContractParams> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<ContractDto>> call({required EditContractParams params}) =>
      _safaqatRepository.editContract(
        contractId: params.contractId,
        body: params.body,
      );
}
