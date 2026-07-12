import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/common/controllers/offers_filters_controller.dart';
import 'package:yemen_offers/core/constants/app_enums.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: BrowseSearchBarWidget(controller: controller),
                    ),
                    OrderingButtonWidget(context),
                  ],
                ),
            
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

  SizedBox OrderingButtonWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1 / 2,
      child: InkWell(
        onTap: () {
          showSortDialog<OfferListOrderBy>(
            context: context,
            title: lblOrderBy.tr,
            selectedValue: controller.sortBy,
            options: [
              MapEntry(lblOrderByDiscount.tr, OfferListOrderBy.discount),
              MapEntry(lblOrderByPriceBefore.tr, OfferListOrderBy.priceBefore),
              MapEntry(lblOrderByPriceAfter.tr, OfferListOrderBy.priceAfter),
              MapEntry(lblOrderByStartDate.tr, OfferListOrderBy.startDate),
              MapEntry(lblOrderByEndDate.tr, OfferListOrderBy.end_date),
            ],
          );
        },
        child: const Icon(
          Icons.sort_rounded,
          size: 36,
          color: AppColors.primary,
        ),
      ),
    );
  }

  void showSortDialog<T>({
    required BuildContext context,
    required String title,
    required List<MapEntry<String, T>>
    options, // key: label, value: enum or any value
    required Rx<T> selectedValue,
  }) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title.tr, style: TextStyle(color: AppColors.primary)),
        content: SizedBox(
          width: double.maxFinite,
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  options.map((option) {
                    final isSelected = selectedValue.value == option.value;
                    return ListTile(
                      title: Text(option.key.tr),
                      trailing:
                          isSelected
                              ? Icon(
                                Icons.radio_button_checked_rounded,
                                color: AppColors.primary,
                              )
                              : null,
                      onTap: () {
                        selectedValue.value = option.value;
                        Get.back();
                      },
                    );
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
