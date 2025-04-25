// import 'package:flutter/material.dart';
// import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_search_bar_widget.dart';

// class BrowseHeaderSectionWidget extends StatelessWidget {
//   const BrowseHeaderSectionWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         BrowseSearchBarWidget(),
//         const SizedBox(width: 8),
//         const Icon(Icons.south_rounded),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_offer_category_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_search_bar_widget.dart';

class BrowseHeaderSectionWidget extends StatelessWidget {
  const BrowseHeaderSectionWidget({super.key, required this.controller});

  final BrowseController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: BrowseSearchBarWidget()),
                const SizedBox(width: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 / 2,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.sort_rounded,
                      size: 36,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // offer category
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
            child: Obx(() {
              final List<OfferCategoryEntity> offerCategories =
                  controller.offerCategories.value;
              return offerCategories.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: offerCategories.length,
                    itemBuilder: (context, index) {
                      final OfferCategoryEntity offerCategory =
                          offerCategories[index];
                      return Obx(() {
                        final List<OfferCategoryEntity>
                        selectedOfferCategories =
                            controller.selectedOfferCategories.value;
                        return BrowseOfferCategoryWidget(
                          offerCategoy: offerCategory,
                          onTap: () {
                            controller.selectOfferCategory(offerCategory);
                          },
                          isSelected: selectedOfferCategories.contains(
                            offerCategory,
                          ),
                        );
                      });
                    },
                  );
            }),
          ),
        ],
      ),
    );
  }
}
