import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/onboarding/presentation/getX/controllers/onboarding_controller.dart';
import 'package:yemen_offers/features/onboarding/presentation/views/widgets/oboarding_indicatiors_widget.dart';
import 'package:yemen_offers/features/onboarding/presentation/views/widgets/onboarding_body_widget.dart';
import 'package:yemen_offers/features/onboarding/presentation/views/widgets/onboarding_bottom_widget.dart';
import 'package:yemen_offers/features/onboarding/presentation/views/widgets/onboarding_header_widget.dart';

class OnboardingPage extends StatelessWidget {
  final controller = Get.put(OnboardingController(), permanent: false);
  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPage = controller.currentPage;
    final onboardingData = controller.onboardingData;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.03,
                child: OnboardingHeaderWidget(controller: controller),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.width * 0.5,
                left: 0,
                right: 0,
                child: Obx(() {
                  return OnboardingIndicatorsWidget(
                    currentPageIndex: currentPage.value,
                    onboardingDataLength: onboardingData.length,
                  );
                }),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: OnboardingBodyWidget(controller: controller),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.1,
                child: Obx(() {
                  return OnboardingBottomWidget(
                    currentPageIndex: currentPage.value,
                    onboardingDataLeng: onboardingData.length,
                    controller: controller,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
