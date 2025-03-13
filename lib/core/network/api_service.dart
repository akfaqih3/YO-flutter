import 'package:dio/dio.dart';
import 'dio_config.dart';
import '../errors/dio_exception.dart';

class ApiService {
  final Dio dio = DioConfig.createDio();

  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getDioErrorMessage(e));
    }
  }

  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getDioErrorMessage(e));
    }
  }

  Future<Response> putRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getDioErrorMessage(e));
    }
  }

  Future<Response> deleteRequest(String endpoint) async {
    try {
      final response = await dio.delete(endpoint);
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getDioErrorMessage(e));
    }
  }
}
