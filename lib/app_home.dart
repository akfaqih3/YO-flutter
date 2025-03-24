import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/binding/core_binding.dart';
import 'package:yemen_offers/core/constants/app_contants.dart';
import 'package:yemen_offers/core/routes/app_pages.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/app_theme.dart';

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
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initialRoute,
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
    // Handle links
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
  }
}
