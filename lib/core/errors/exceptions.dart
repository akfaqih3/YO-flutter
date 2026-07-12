import 'package:dio/dio.dart';
import 'package:yemen_offers/core/errors/failures.dart';

abstract class Exceptions {
  static handleCatch(Object e) {
    if (e is DioException) {
      // if (e.type == DioExceptionType.badResponse) {
      //   return e.response!.data['detail'];
      // }
      return ServerFailure.fromDioException(e);
    }
    return ServerFailure(e.toString());
  }
}
