import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/app_enums.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_list_vertical_skeleton_widget.dart';
import 'package:yemen_offers/features/search/presentation/getX/controllers/search_controller.dart';
import 'package:yemen_offers/features/search/presentation/views/widgets/search_bar_widget.dart';
import 'package:yemen_offers/features/search/presentation/views/widgets/search_image_widget.dart';
import 'package:yemen_offers/features/search/presentation/views/widgets/search_offers_widget.dart';

class SearchPage extends GetView<SearchOffersController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            // search bar
            const SizedBox(height: 10),
            Obx(
              () =>
                  controller.searchType.value == SearchOffersType.vector
                      ? SearchBarWidget(controller: controller)
                      : SearchImageWidget(controller: controller),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                controller.search();
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary,
                    style:
                        BorderStyle
                            .solid, // Change to dotted if using custom painter
                    width: 1.5,
                  ),
                ),
                child: Center(child: Text(lblSearch.tr,style: Get.textTheme.bodyLarge!.apply(color: AppColors.white),),),
              ),
            ),
            //show a count of results
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
        
              children: [
                Text("${lblOffersCount.tr}: "),
                Obx(
                  () => Text(
                    "${controller.count.value}",
                    style: Get.textTheme.bodyMedium!.apply(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () =>
                    controller.isloading.value
                        ? SizedBox(
                          height: 700,
                          child: const OfferListVerticalSkeletonWidget(),
                        )
                        : controller.offers.value.isEmpty
                        ? Center(
                          child: Text(
                            lblNoOffers.tr,
                            style: Get.textTheme.bodyLarge!.apply(
                              color: AppColors.grey,
                            ),
                          ),
                        )
                        : SearchOffersWidget(offers: controller.offers.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
