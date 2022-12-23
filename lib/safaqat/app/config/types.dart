

typedef ResultCallback<T, R> = R Function(T value);
typedef VoidCallback<T> = void Function(T value);
typedef VoidCallback2<T1, T2> = void Function(T1 value1, T2 value2);
typedef ResultCallback2<T1, T2, R> = R Function(T1 value1, T2 value2);

