import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/app_enums.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/home/presentation/getX/controller/home_controller.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/categories/home_categories_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_section_heading_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_latest_offers_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/home_most_popular_offers_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_list_horizontal_skeleton_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/sections/store_list_horizontal_widget.dart';
import 'package:yemen_offers/features/home/presentation/views/widgets/skeleton/category_skeleton_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Container(
      padding: EdgeInsets.only(
        left: isRTL ? 0 : 8,
        right: isRTL ? 8 : 0,
        top: 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Get.theme.scaffoldBackgroundColor,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Obx(() {
            final categories = controller.categoriesController.categories.value;

            return categories.isEmpty
                ? const CategorySkeletonWidget()
                : HomeCategoriesWidget(categories: categories);
          }),
          HomeSectionHeadingWidget(
            title: lblStores.tr,
            showActionButton: true,
            onPressed: () {
              Get.toNamed(AppRoutes.storeList);
            },
            textColor: Colors.black,
            buttonTitle: btnViewAll.tr,
          ),
          Obx(() {
            return controller.isStoresLoading.value ||
                    controller.stores.value.isEmpty
                ? const CircularProgressIndicator()
                : StoreListHorizontalWidget(stores: controller.stores.value);
          }),

          HomeSectionHeadingWidget(
            title: lblMostPopularOffers.tr,
            showActionButton: true,
            onPressed: () {
              Get.toNamed(
                AppRoutes.offerList,
                arguments: {'offerListType': OfferListType.mostPopular},
              );
            },
            textColor: Colors.black,
            buttonTitle: btnViewAll.tr,
          ),

          Obx(() {
            return controller.isMostPopularOffersLoading.value ||
                    controller.mostPopularOffers.value.isEmpty
                ? const OfferListHorizontalSkeletonWidget()
                : HomeMostPopularOffersSectionWidget(
                  offers: controller.mostPopularOffers.value,
                );
          }),
          HomeSectionHeadingWidget(
            title: lblLatestOffers.tr,
            showActionButton: true,
            onPressed: () {
              Get.toNamed(
                AppRoutes.offerList,
                arguments: {'offerListType': OfferListType.latest},
              );
            },
            textColor: Colors.black,
            buttonTitle: btnViewAll.tr,
          ),
          Obx(() {
            return controller.isLatestOffersLoading.value ||
                    controller.latestOffers.value.isEmpty
                ? const OfferListHorizontalSkeletonWidget()
                : HomeLatestOffersWidget(offers: controller.latestOffers.value);
          }),
        ],
      ),
    );
  }
}
