import 'package:safaqat/safaqat/app/config/strings.dart';

enum ContractStatus {
  // ignore: unused_field
  _,
  solicitation,
  ongoing,
  planned,
  closed;

  static List<ContractStatus> get items => values.skip(1).toList();

  String get name => toString();

  @override
  String toString() {
    switch (this) {
      case ContractStatus.solicitation:
        return AppStrings.solicitation;
      case ContractStatus.ongoing:
        return AppStrings.ongoing;
      case ContractStatus.planned:
        return AppStrings.planned;
      case ContractStatus.closed:
        return AppStrings.closed;
      default:
        return toString();
    }
  }

  static ContractStatus fromInt(int index) {
    if (index == ContractStatus.solicitation.index) {
      return ContractStatus.solicitation;
    } else if (index == ContractStatus.ongoing.index) {
      return ContractStatus.ongoing;
    } else if (index == ContractStatus.planned.index) {
      return ContractStatus.planned;
    } else if (index == ContractStatus.closed.index) {
      return ContractStatus.closed;
    }
    return ContractStatus._;
  }
}
