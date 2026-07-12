import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_offer_category_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_category_skeleton_widget.dart';

class OfferCategoryListWidget extends StatelessWidget {
  const OfferCategoryListWidget({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List<OfferCategoryEntity> offerCategories =
          controller.offerCategories.value;
      return controller.offerCategoriesIsLoading.value
          ? OfferCategorySkeletonWidget()
          : offerCategories.isEmpty
          ? const SizedBox()
          : SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: offerCategories.length,
              itemBuilder: (context, index) {
                final OfferCategoryEntity offerCategory =
                    offerCategories[index];
                return Obx(() {
                  final List<String> selectedOfferCategories =
                      controller.selectedOfferCategories.value;
                  return BrowseOfferCategoryWidget(
                    offerCategoy: offerCategory,
                    onTap: () {
                      controller.selectOfferCategory(offerCategory);
                    },
                    isSelected: selectedOfferCategories.contains(
                      offerCategory.slug,
                    ),
                  );
                });
              },
            ),
          );
    });
  }
}
