import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/onboarding/presentation/getX/controllers/onboarding_controller.dart';

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({super.key, required this.controller});
  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.currentPage.value = index;
          },
          itemCount: controller.onboardingData.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      controller.onboardingData[index]["title"]!,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color:
                            Get.isDarkMode
                                ? AppColors.textSecondary
                                : AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      controller.onboardingData[index]["description"]!,
                      softWrap: true,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        controller.onboardingData[index]["image"]!,
                      ),
                    ),
                  ),
                  height: MediaQuery.of(context).size.width - 32,
                  width: MediaQuery.of(context).size.width - 32,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            );
          },
        ),
      ),
    );
  }
}
