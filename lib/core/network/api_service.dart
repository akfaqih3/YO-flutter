import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'dio_config.dart';
import '../errors/dio_exception.dart';

class ApiService extends getx.GetxService {
  final Dio dio = DioConfig().dio;
  @override
  void onInit() {
    super.onInit();
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await dio.get(endpoint, queryParameters: queryParams);
    return response;
  }

  Future<Response> post(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await dio.post(endpoint, data: data);
    return response;
  }

  Future<Response> put(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await dio.put(endpoint, data: data);
    return response;
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await dio.delete(endpoint);
    return response;
  }
}
