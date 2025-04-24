import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';

class MainMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (CacheHelper.getData(CacheKeys.isFirstOpen) == null) {
      return const RouteSettings(name: AppRoutes.onboarding);
    } else {
      return null;
    }
  }
}
