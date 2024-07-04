import 'package:flutter_phoenix_academy/config/state/data_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DataState Tests', () {
    test('DataState.success should create a success state with data', () {
      // Arrange
      int testData = 42;

      // Act
      DataState<int> successState = DataState.success(testData);

      // Assert
      expect(successState.type, DataStateType.success);
      expect(
        successState.when(
          success: (data) => data,
          error: (message, code, statusCode, exception, stackTrace) =>
              throw AssertionError('Unexpected error state'),
        ),
        testData,
      );
    });

    test('DataState.error should create an error state with details', () {
      // Arrange
      String errorMessage = 'Something went wrong';
      int errorCode = 500;
      String errorStatusCode = '404';
      Exception errorException = Exception('Custom exception');
      StackTrace errorStackTrace = StackTrace.current;

      // Act
      DataState<int> errorState = DataState.error(
        message: errorMessage,
        code: errorCode,
        statusCode: errorStatusCode,
        exception: errorException,
        stackTrace: errorStackTrace,
      );

      // Assert
      expect(errorState.type, DataStateType.error);
      expect(
        errorState.when(
          success: (data) => throw AssertionError('Unexpected success state'),
          error: (message, code, statusCode, exception, stackTrace) {
            expect(message, errorMessage);
            expect(code, errorCode);
            expect(statusCode, errorStatusCode);
            expect(exception, errorException);
            expect(stackTrace, errorStackTrace);
          },
        ),
        null, // Ensure the error case is tested correctly
      );
    });
    //
    // test('DataState.maybeWhen should handle success and error cases', () {
    //   // Arrange
    //   int testData = 42;
    //   String errorMessage = 'Something went wrong';
    //   int errorCode = 500;
    //   String errorStatusCode = '404';
    //   Exception errorException = Exception('Custom exception');
    //   StackTrace errorStackTrace = StackTrace.current;
    //
    //   // Act
    //   DataState<int> successState = DataState.success(testData);
    //   DataState<int> errorState = DataState.error(
    //     message: errorMessage,
    //     code: errorCode,
    //     statusCode: errorStatusCode,
    //     exception: errorException,
    //     stackTrace: errorStackTrace,
    //   );
    //
    //   // Assert - Success case
    //   expect(
    //     successState.maybeWhen(
    //       success: (data) => data,
    //       error: (message, code, statusCode, exception, stackTrace) =>
    //           throw AssertionError('Unexpected error state'),
    //       orElse: () => throw AssertionError('Unexpected unknown state'),
    //     ),
    //     testData,
    //   );
    //
    //   // Assert - Error case
    //   errorState.maybeWhen(
    //     success: (data) => throw AssertionError('Unexpected success state'),
    //     error: (message, code, statusCode, exception, stackTrace) {
    //       expect(message, errorMessage);
    //       expect(code, errorCode);
    //       expect(statusCode, errorStatusCode);
    //       expect(exception, errorException);
    //       expect(stackTrace, errorStackTrace);
    //     },
    //     orElse: () => throw AssertionError('Unexpected unknown state'),
    //   );
    // });
    //
    // test('DataState.maybeWhen should handle unknown state with orElse', () {
    //   // Arrange
    //   DataState<Object> unknownState =
    //       DataState.success("100"); // Example of unknown state
    //
    //   // Act & Assert
    //   expect(
    //     () => unknownState.maybeWhen(
    //       success: (data) => throw AssertionError('Unexpected success state'),
    //       error: (message, code, statusCode, exception, stackTrace) =>
    //           throw AssertionError('Unexpected error state'),
    //       orElse: () =>
    //           'Unknown state occurred', // Custom handling for unknown state
    //     ),
    //     'Unknown state occurred',
    //   );
    // });
  });
}
