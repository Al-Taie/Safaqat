import 'package:get/get.dart';
import 'package:safaqat/safaqat/app/core/usecases/param_usecase.dart';
import 'package:safaqat/safaqat/data/models/contract/contract_response.dart';
import 'package:safaqat/safaqat/domain/entities/contracts/contract_query.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';
import 'package:safaqat/safaqat/domain/repositories/safaqat_repository.dart';

class GetMyContractsUseCase
    extends ParamUseCase<Resources<ContractResponse>, ContractQuery> {
  final SafaqatRepository _safaqatRepository = Get.find();

  @override
  Future<Resources<ContractResponse>> call({required ContractQuery params}) =>
      _safaqatRepository.getMyContracts(
        pageSize: params.pageSize,
        pageNumber: params.pageNumber,
        projectId: params.projectId,
      );
}
