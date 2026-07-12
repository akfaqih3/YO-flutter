import 'package:flutter/material.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class OnboardingIndicatorsWidget extends StatelessWidget {
  const OnboardingIndicatorsWidget({super.key, required this.currentPageIndex, required this.onboardingDataLength});
  final int currentPageIndex;
  final int onboardingDataLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingDataLength,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPageIndex == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPageIndex == index ? AppColors.primary : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
