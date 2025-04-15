import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'dio_config.dart';

class ApiService extends getx.GetxService {

  // make it singleton
  static ApiService? _instance;
  factory ApiService() {
    _instance ??= ApiService._();
    return _instance!;
  }
  ApiService._();


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
    Object? data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    final response = await dio.delete(endpoint,data: data);
    return response;
  }
}
