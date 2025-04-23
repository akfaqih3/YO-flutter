import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/constants/app_contants.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/features/onboarding/data/repos/onboarding_repo_impl.dart';
import 'package:yemen_offers/features/onboarding/data/sources/onboarding_local_data_source.dart';
import 'package:yemen_offers/features/onboarding/domain/use_cases/set_false_first_open_app_use_case.dart';

class OnboardingController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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

  void goToLoginPage() async {
    await _closeOnboarding();
    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> _closeOnboarding() async {
    final SetFalseFirstOpenAppUseCase setFalseFirstOpenAppUseCase =
        SetFalseFirstOpenAppUseCase(
          OnboardingRepoImpl(OnboardingLocalDataSourceImpl()),
        );
    final restult = await setFalseFirstOpenAppUseCase.execute();
    restult.fold(
      (left) {
        Get.snackbar("error", left.message);
      },
      (right) {
        return right;
      },
    );
  }

  @override
  void dispose() async {
    super.dispose();
    pageController.dispose();
  }
}
