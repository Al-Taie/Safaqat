
import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_body.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_dto.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class AddContractUseCase extends ParamUseCase<Resources<ContractDto>, ContractBody> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<ContractDto>> call({required ContractBody params}) =>
      _safaqatRepository.addContract(body: params);
}
