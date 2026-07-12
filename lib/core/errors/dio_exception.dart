import 'package:dio/dio.dart';
import 'package:yemen_offers/core/errors/failures.dart';

abstract class DioErrorHandler {
  static ServerFailure getDioErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("انتهت مهلة الاتصال بالخادم.");
      case DioExceptionType.sendTimeout:
        return ServerFailure("انتهت مهلة إرسال البيانات.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("انتهت مهلة استقبال البيانات.");
      case DioExceptionType.badCertificate:
        return ServerFailure("الشهادة الأمنية غير صالحة.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure("تم إلغاء الطلب.");
      case DioExceptionType.connectionError:
        return ServerFailure("تعذر الاتصال بالخادم.");
      case DioExceptionType.unknown:
        return ServerFailure("حدث خطأ غير متوقع.");
    }
  }

  static ServerFailure getResponseErrorMessage(Response response) {
    switch (response.statusCode) {
      case 400:
        return ServerFailure("خطأ في الطلب.");
      case 401:
        return ServerFailure("يرجى تسجيل الدخول أو إعادة تسجيل الدخول.");
      case 403:
        return ServerFailure("ليس لديك الصلاحية للوصول إلى هذا المكان.");
      case 404:
        return ServerFailure("المكان غير موجود.");

      case 500:
        return ServerFailure("خطأ في الخادم.");

      default:
        return ServerFailure("خطأ غير معروف.");
    }
  }
}
