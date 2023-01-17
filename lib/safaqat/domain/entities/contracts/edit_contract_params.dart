
import 'package:safaqat/safaqat/data/models/contract/contract_body.dart';

class EditContractParams {
  EditContractParams({
    required this.contractId,
    required this.body,
  });

  final String? contractId;
  final ContractBody body;
}
