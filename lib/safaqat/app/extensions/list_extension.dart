extension ListExtension<T> on List<T>? {
  T? get firstOrNull {
    if (this != null && this?.isNotEmpty == true) {
      return this?.first;
    }
    return null;
  }

  T? getOrNull(int index) {
    try {
      return this![index];
    } catch (e) {
      return null;
    }
  }

  List<T>? getOr(List<T>? value) =>
      (this != null && this!.isNotEmpty) ? this : value;
}
