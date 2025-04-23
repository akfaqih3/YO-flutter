import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/onboarding/presentation/getX/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.8, end: 1.0),
              duration: Duration(seconds: 2),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Obx(() => AnimatedOpacity(
                        opacity: controller.opacity.value,
                        duration: Duration(seconds: 1),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          width: 128,
                          height: 128,
                          child: Image.asset(
                            AppAssets.appLogo,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      )),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Obx(() => AnimatedOpacity(
                    opacity: controller.opacity.value,
                    duration: Duration(seconds: 2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Yemen Offers',
                          style: TextStyle(
                            fontSize: 28,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'كل العروض بين يديك، الأقرب إليك أولاً!',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
