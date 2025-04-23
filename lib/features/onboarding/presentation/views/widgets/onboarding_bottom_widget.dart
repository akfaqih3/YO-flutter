import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class OnboardingBottomWidget extends StatelessWidget {
  const OnboardingBottomWidget({
    super.key,
    required this.currentPageIndex,
    required this.onboardingDataLeng,
    required this.pageController,
  });

  final int currentPageIndex;
  final int onboardingDataLeng;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 256,
        height: 64,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.primary),
            elevation: WidgetStateProperty.all(4),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          onPressed:
              currentPageIndex == onboardingDataLeng - 1
                  ? () {
                    Get.offNamed(AppRoutes.login);
                  }
                  : () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
          child: Text(
            style: TextStyle(fontSize: 24),
            currentPageIndex == onboardingDataLeng - 1 ? btnLetsGo.tr : btnNext.tr,
          ),
        ),
      ),
    );
  }
}
