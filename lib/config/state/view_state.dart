// Enum to represent different states
enum ViewStateType { initial, loading, success, failed }

// Class to hold view state with generics
class ViewState<T> {
  final ViewStateType type;
  final T? data;
  final String? message;

  // Private constructor to enforce usage of factory constructors
  ViewState._({
    required this.type,
    this.data,
    this.message,
  });

  // Factory constructors for each state type
  factory ViewState.initial() => ViewState<T>._(type: ViewStateType.initial);

  factory ViewState.loading() => ViewState<T>._(type: ViewStateType.loading);

  factory ViewState.success(T data) => ViewState<T>._(
        type: ViewStateType.success,
        data: data,
      );

  factory ViewState.failed(String message) => ViewState<T>._(
        type: ViewStateType.failed,
        message: message,
      );

  // Pattern matching function (when)
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T data) success,
    required R Function(String message) failed,
  }) {
    switch (type) {
      case ViewStateType.initial:
        return initial();
      case ViewStateType.loading:
        return loading();
      case ViewStateType.success:
        if (data != null) {
          return success(data as T);
        }
        throw ArgumentError('Data cannot be null in Success state');
      case ViewStateType.failed:
        if (message != null) {
          return failed(message!);
        }
        throw ArgumentError('Message cannot be null in Failed state');
      default:
        throw ArgumentError('Unknown ViewState type');
    }
  }

  // Helper methods to check current state
  bool get isInitial => type == ViewStateType.initial;

  bool get isLoading => type == ViewStateType.loading;

  bool get isSuccess => type == ViewStateType.success;

  bool get isFailed => type == ViewStateType.failed;

  @override
  String toString() {
    switch (type) {
      case ViewStateType.initial:
        return 'ViewState: Initial';
      case ViewStateType.loading:
        return 'ViewState: Loading';
      case ViewStateType.success:
        return 'ViewState: Success - $data';
      case ViewStateType.failed:
        return 'ViewState: Failed - $message';
      default:
        return 'Unknown ViewState';
    }
  }
}
