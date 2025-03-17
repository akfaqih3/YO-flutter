import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/binding/core_binding.dart';
import 'package:yemen_offers/core/constants/app_contants.dart';
import 'package:yemen_offers/core/routes/app_pages.dart';
import 'package:yemen_offers/core/theme/app_theme.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

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
}
