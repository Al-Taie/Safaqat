class Resources<T> {
  T? data;
  String? error;
  Status status = Status.init;
  double? statusCode;

  Resources._({
    required this.status,
    this.data,
    this.error,
    this.statusCode,
  });

  factory Resources.init() {
    return Resources._(status: Status.init);
  }

  factory Resources.loading() {
    return Resources._(status: Status.loading);
  }

  factory Resources.success(
      T data,
      double? statusCode,
      ) {
    return Resources._(
      status: Status.success,
      data: data,
      statusCode: statusCode,
    );
  }

  factory Resources.empty(T? data) {
    return Resources._(
      status: Status.empty,
      data: data,
    );
  }

  factory Resources.error(
      String? error,
      double? statusCode,
      ) {
    return Resources._(
      status: Status.error,
      error: error,
      statusCode: statusCode,
    );
  }
}

enum Status {
  init,
  loading,
  success,
  error,
  empty,
}
