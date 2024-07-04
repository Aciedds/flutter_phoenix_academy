import 'package:dio/dio.dart';

class ClientService {
  late final Dio dio;

  ClientService(String baseUrl) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 9),
      receiveTimeout: const Duration(seconds: 5),
    ));
  }

  ClientService setToken(String token) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
    return this;
  }

  ClientService setHeader(Map<String, String> headers) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers = headers;
          return handler.next(options);
        },
      ),
    );
    return this;
  }

  ClientService setInterceptors(List<Interceptor> interceptors) {
    dio.interceptors.addAll(interceptors);
    return this;
  }

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? requestBody,
    bool isQueryParam = false,
  }) async {
    try {
      if (requestBody != null) {
        if (isQueryParam) {
          return dio.get<T>(path, queryParameters: requestBody);
        }
        return dio.get<T>(path, data: FormData.fromMap(requestBody));
      }
      return dio.get<T>(path);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> post<T>({
    required String path,
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      return dio.post<T>(path, data: requestBody);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> put<T>({
    required String path,
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      return dio.put<T>(path, queryParameters: requestBody);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> delete<T>({
    required String path,
    Map<String, dynamic>? requestBody,
  }) async {
    try {
      return dio.delete<T>(path, queryParameters: requestBody);
    } catch (e) {
      rethrow;
    }
  }
}
