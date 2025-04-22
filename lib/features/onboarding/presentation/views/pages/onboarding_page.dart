import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/onboarding/presentation/getX/controllers/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  

  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = controller.pageController;
    final currentPage = controller.currentPage;
    final onboardingData = controller.onboardingData;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                currentPage.value = index;
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardingData[index]["image"]!),
                      const SizedBox(height: 20),
                      Text(
                        onboardingData[index]["title"]!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:
                              Get.isDarkMode
                                  ? AppColors.textSecondary
                                  : AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        onboardingData[index]["description"]!,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage.value == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        currentPage.value == index
                            ? AppColors.primary
                            : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.offNamed(AppRoutes.login);
                    },
                    child:  Text(
                      btnSkip.tr,
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        currentPage.value == onboardingData.length - 1
                            ? () {
                              Get.offNamed(AppRoutes.login);
                            }
                            : () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                    child: Text(
                      style: TextStyle(color: AppColors.primary),
                      currentPage.value == onboardingData.length - 1
                          ? btnLetsGo.tr
                          : btnNext.tr,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
