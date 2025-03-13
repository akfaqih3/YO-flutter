import 'package:dio/dio.dart';

class DioErrorHandler {
  static String getDioErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "انتهت مهلة الاتصال بالخادم.";
      case DioExceptionType.sendTimeout:
        return "انتهت مهلة إرسال البيانات.";
      case DioExceptionType.receiveTimeout:
        return "انتهت مهلة استقبال البيانات.";
      case DioExceptionType.badCertificate:
        return "الشهادة الأمنية غير صالحة.";
      case DioExceptionType.badResponse:
        return "خطأ في الاستجابة من الخادم.";
      case DioExceptionType.cancel:
        return "تم إلغاء الطلب.";
      case DioExceptionType.connectionError:
        return "تعذر الاتصال بالخادم.";
      case DioExceptionType.unknown:
        return "حدث خطأ غير متوقع.";
    }
  }
}
