import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/controllers/offers_filters_controller.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_list_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/browse/header/browse_search_bar_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offers_list_vertical_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers_filters_button_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_list_vertical_skeleton_widget.dart';

class OfferListPage extends GetView<OfferListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.offerListType.value.name)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Column(
            children: [
              BrowseSearchBarWidget(controller: controller),
              const SizedBox(height: 8),
              Obx(
                () =>
                    controller.offersIsLoading.value
                        ? const SizedBox()
                        : SizedBox(
                          width: MediaQuery.of(context).size.width - 32,
                          child: Text(
                            "-${lblOffersCount.tr}: ${controller.offers.value.length}",
                            textAlign: TextAlign.start,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: OffersFiltersButtonWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  child: Obx(() {
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
                        : OffersListVerticalWidget(offers: offers);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
