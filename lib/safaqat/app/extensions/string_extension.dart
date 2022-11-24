

extension StringExtension on String? {
  String? getOr(String? value) => (this != null && this!.isNotEmpty) ? this : value;
}
