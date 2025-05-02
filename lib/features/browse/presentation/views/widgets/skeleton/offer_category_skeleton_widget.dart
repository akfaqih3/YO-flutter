import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class OfferCategorySkeletonWidget extends StatelessWidget {
  const OfferCategorySkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6, 
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) =>  Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              constraints: const BoxConstraints(minWidth: 80),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: AppColors.secondary.withAlpha(100)),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: const SizedBox(height: 16, width: 60),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
