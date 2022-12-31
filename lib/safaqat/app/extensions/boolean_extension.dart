
extension BooleanExtension on bool {
  bool not() => !this;
}

extension BooleanNullableExtension on bool? {
  bool get isTrue => this == true;
  bool get isFalse => this == false;
}
