import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/constants/app_contants.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';

class OnboardingController extends GetxController {
  final currentPage = 0.obs;
  final isFirstOpen = CacheHelper.getData(CacheKeys.isFirstOpen) ?? true;
  final pageController = PageController();

  @override
  void onInit() async {
    super.onInit();
    if (!isFirstOpen) {
      Get.offAllNamed(AppRoutes.main);
    }
  }

  @override
  void onReady() {
    super.onReady();
    CacheHelper.saveData(CacheKeys.isFirstOpen, false);
  }

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppAssets.onboardingMap,
      "title": lblOnboardingMap.tr,
      "description": txtOnboardingMap.tr,
    },
    {
      "image": AppAssets.onboardingYO,
      "title": lblOnboardingYO.tr,
      "description": txtOnboardingYO.tr,
    },
    {
      "image": AppAssets.onboardingFav,
      "title": lblOnboardingFav.tr,
      "description": txtOnboardingFav.tr,
    },
  ];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
