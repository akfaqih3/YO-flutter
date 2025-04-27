import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/tabs/offer_tab_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/tabs/store_tab_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_list_vertical_skeleton_widget.dart';

class BrowseTapBarViewWidget extends StatelessWidget {
  const BrowseTapBarViewWidget({super.key, required this.controller});

  final BrowseController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller.tabController,
        children: [
          Obx(() {
            final List<OfferEntity> offers = controller.offers.value;
            return (controller.offersIsLoading.value)
                ? OfferListVerticalSkeletonWidget()
                : (offers.isEmpty)
                ? Center(
                  child: Text(
                    lblNoOffers.tr,
                    style: TextStyle(color: AppColors.secondary),
                  ),
                )
                : OfferTabWidget(
                  offers: offers,
                  scrollController: controller.scrollController,
                );
          }),
          Obx(() {
            return controller.stores.value.isEmpty
                ? const CircularProgressIndicator(
                  color: AppColors.primary,
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.secondary,
                  ),
                  semanticsLabel: 'المتاجر',
                )
                : StoreTabWidget(
                  stores: controller.stores.value,
                  scrollController: controller.scrollController,
                );
          }),
        ],
      ),
    );
  }
}
