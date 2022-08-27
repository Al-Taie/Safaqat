
extension ObjectExtension on Object? {
  double? toDoubleOrNull() {
    try {
      return this as double;
    } catch (e) {
      return null;
    }
  }
}
