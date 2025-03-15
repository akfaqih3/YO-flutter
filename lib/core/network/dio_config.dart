import 'package:dio/dio.dart';

class DioConfig {
  static Dio createDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl:
            "https://api.yourwebsite.com/", // ✨ غيّر هذا بعنوان API الخاص بك
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    // إضافة Interceptor لتسجيل الطلبات والاستجابات
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("🔵 [Request] ${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("🟢 [Response] ${response.statusCode} ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("🔴 [Dio Error] ${e.message}");
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
