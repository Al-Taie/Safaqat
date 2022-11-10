extension ListExtension<E> on List<E>? {
  E? get firstOrNull {
    if (this != null && this?.isNotEmpty == true) {
      return this?.first;
    }
    return null;
  }

  E? getOrNull(int index) {
    try {
      return this![index];
    } catch (e) {
      return null;
    }
  }
}
