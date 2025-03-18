import 'package:dio/dio.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';

class DioConfig {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConst.baseUrl,
      connectTimeout: Duration(milliseconds: ApiConst.connectTimeout),
      receiveTimeout: Duration(milliseconds: ApiConst.receiveTimeout),
    ),
  );

  Dio get dio => _dio;

  DioConfig() {
    _setIntercepter();
  }

  _setIntercepter() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? accessToken = await CacheHelper.getData(
            CacheKeys.accessToken,
          );

          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }
}
