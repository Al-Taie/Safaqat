import 'package:safaqat/safaqat/app/config/strings.dart';

enum GenderType {
  // ignore: unused_field
  _,
  male,
  female;

  static List<GenderType> get items => values.skip(1).toList();
  String get name => toString();

  @override
  String toString() => (this == male) ? AppStrings.male : AppStrings.female;
}
