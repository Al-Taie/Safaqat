import 'package:safaqat/safaqat/app/config/strings.dart';

enum CurrencyType {
  // ignore: unused_field
  _,
  dinar,
  dollar;

  static List<CurrencyType> get items => values.skip(1).toList();
  String get name => toString();

  static CurrencyType fromInt(int value){
    switch(value){
      case 1: return CurrencyType.dinar;
      case 2: return CurrencyType.dollar;
      default: return CurrencyType._;
    }
  }

  @override
  String toString() => (this == dinar) ? AppStrings.dinar : AppStrings.dollar;
}
