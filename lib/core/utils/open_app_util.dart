import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/fcm_token_services.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/models/login_model.dart';

void openAppLink(Uri uri) {
  if (uri.path.contains('/api/password_reset/confirm/')) {
    try {
      String token = uri.queryParameters['token'] ?? '';
      if (token.isNotEmpty) {
        Future.delayed(Duration(milliseconds: 300), () {
          Get.toNamed(AppRoutes.confirmResetPassword, arguments: token);
        });
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  if (uri.path.contains('/login-success/')) {
    String accesstoken = uri.queryParameters['access_token'] ?? '';
    String refreshToken = uri.queryParameters['refresh_token'] ?? '';
    if (accesstoken.isNotEmpty && refreshToken.isNotEmpty) {
      final LoginModel loginModel = LoginModel(
        access: accesstoken,
        refresh: refreshToken,
      );
      _login(loginModel);
    }
  }
  if (uri.path.contains('/confirm-email/')) {
    String otp = uri.queryParameters['otp'] ?? '';
    if (otp.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 300), () {
        Get.offAllNamed(AppRoutes.confirmAccount, arguments: otp);
      });
    }
  }
}

_login(LoginModel loginModel) async {
  final LoginLocalDataSource loginLocalDataSource = LoginLocalDataSourceImpl();
  await loginLocalDataSource.saveToken(loginModel);
  await FcmTokenServices.sendFCMTokenToServer();
}
