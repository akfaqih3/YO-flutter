import 'package:dio/dio.dart';
import 'package:yemen_offers/core/errors/dio_exception.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    return DioErrorHandler.getDioErrorMessage(e);
  }

  factory ServerFailure.fromResponse(Response response) {
    return DioErrorHandler.getResponseErrorMessage(response);
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
