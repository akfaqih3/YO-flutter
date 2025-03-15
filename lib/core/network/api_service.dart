import 'package:dio/dio.dart';
import 'dio_config.dart';
import '../errors/dio_exception.dart';

class ApiService {
  final Dio dio = DioConfig.createDio();

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getDioErrorMessage(e));
    }
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getDioErrorMessage(e));
    }
  }

  Future<Response> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getDioErrorMessage(e));
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      final response = await dio.delete(endpoint);
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getDioErrorMessage(e));
    }
  }
}
