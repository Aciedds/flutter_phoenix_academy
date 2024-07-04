// Enum to represent different data state types
enum DataStateType { success, error }

// Abstract base class for data state
abstract class DataState<T> {
  final DataStateType type;

  DataState(this.type);

  // Factory constructor for success state
  factory DataState.success(T data) => DataStateSuccess<T>(data);

  // Factory constructor for error state
  factory DataState.error({
    required String message,
    int? code,
    String? statusCode,
    Exception? exception,
    StackTrace? stackTrace,
  }) =>
      DataStateError<T>(
        message: message,
        code: code,
        statusCode: statusCode,
        exception: exception,
        stackTrace: stackTrace,
      );

  R when<R>({
    required R Function(T data) success,
    required R Function(String message, int? code, String? statusCode,
            Exception? exception, StackTrace? stackTrace)
        error,
  }) {
    switch (type) {
      case DataStateType.success:
        if (this is DataStateSuccess<T>) {
          return success((this as DataStateSuccess<T>).data);
        }
        throw StateError(
            'Invalid state: Expected DataStateSuccess, got $runtimeType');
      case DataStateType.error:
        if (this is DataStateError<T>) {
          return error(
            (this as DataStateError<T>).message,
            (this as DataStateError<T>).code,
            (this as DataStateError<T>).statusCode,
            (this as DataStateError<T>).exception,
            (this as DataStateError<T>).stackTrace,
          );
        }
        throw StateError(
            'Invalid state: Expected DataStateError, got $runtimeType');
    }
  }
}

// Data state class for success
class DataStateSuccess<T> extends DataState<T> {
  final T data;

  DataStateSuccess(this.data) : super(DataStateType.success);
}

// Data state class for error
class DataStateError<T> extends DataState<T> {
  final String message;
  final int? code;
  final String? statusCode;
  final Exception? exception;
  final StackTrace? stackTrace;

  DataStateError({
    required this.message,
    this.code,
    this.statusCode,
    this.exception,
    this.stackTrace,
  }) : super(DataStateType.error);
}
