import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';

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
      "image": "assets/images/onboarding/onboarding_map.png",
      "title": "اكتشف العروض القريبة منك",
      "description": "بدون تعب ولا دوار، شوف أقرب العروض من حولك بكل سهولة، ووفّر وقتك وفلوسك.",
    },
    {
      "image": "assets/images/onboarding/onboarding_YO.png",
      "title": "عروض تناسب ذوقك",
      "description":
          "نختار لك العروض اللي تهمك، حسب اللي يعجبك وتشوفه بالتطبيق، علشان تلاقي كل جديد بسرعة.",
    },
    {
      "image": "assets/images/onboarding/onboarding_fav.png",
      "title": "تابع متاجرك واحفظ اللي يعجبك",
      "description":
          "ما يفوتك شي! احفظ العروض اللي تحبها، وخليك أوّل من يعرف لما ينزل عرض جديد.",
    },
  ];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

}
