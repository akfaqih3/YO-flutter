import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/binding/core_binding.dart';
import 'package:yemen_offers/core/constants/app_contants.dart';
import 'package:yemen_offers/core/routes/app_pages.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/fcm_token_services.dart';
import 'package:yemen_offers/core/services/localizition/translate.dart';
import 'package:yemen_offers/core/theme/app_theme.dart';
import 'package:yemen_offers/features/auth/data/data_sources/login_local_data_source.dart';
import 'package:yemen_offers/features/auth/data/models/login_model.dart';

class AppHome extends StatefulWidget {
  // const AppHome({super.key});

  const AppHome._internal();
  static final AppHome _singleton = AppHome._internal();
  factory AppHome() => _singleton;

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  StreamSubscription<Uri>? _linkSubscription;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initialRoute,
      smartManagement: SmartManagement.full,
      translations: Translate(),
      locale: Locale(AppConstants.defaultLanguage),
    );
  }

  @override
  void initState() {
    super.initState();

    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _linkSubscription = AppLinks().uriLinkStream.listen((uri) {
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    if (uri.path.contains('/api/password_reset/confirm/')) {
      try {
        String token = uri.queryParameters['token'] ?? '';
        if (token.isNotEmpty) {
          Get.offAllNamed(AppRoutes.confirmResetPassword, arguments: token);
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
      if (otp.isNotEmpty) {}
    }
  }

  _login(LoginModel loginModel) async {
    final LoginLocalDataSource loginLocalDataSource =
        LoginLocalDataSourceImpl();
    await loginLocalDataSource.saveToken(loginModel);
    await FcmTokenServices.sendFCMTokenToServer();
  }
}
