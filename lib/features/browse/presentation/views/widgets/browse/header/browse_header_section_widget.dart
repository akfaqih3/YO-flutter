import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yemen_offers/core/constants/app_enums.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/browse_controller.dart';
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
            height: MediaQuery.of(context).size.height * 0.06,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: BrowseSearchBarWidget(controller: controller)),
                const SizedBox(width: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 / 2,
                  child: InkWell(
                    onTap: () {
                      showSortDialog<OfferListType>(
                        context: context,
                        title: lblOrderBy.tr,
                        selectedValue: controller.orderingOptions,
                        options: [
                          MapEntry(lblOrderByNearby.tr, OfferListType.nearby),
                          MapEntry(lblOrderByLatest.tr, OfferListType.latest),
                          MapEntry(
                            lblOrderByMostPopular.tr,
                            OfferListType.mostPopular,
                          ),

                          // MapEntry(
                          //   lblOrderByPriceBefore.tr,
                          //   OfferListOrderBy.priceBefore,
                          // ),
                          // MapEntry(
                          //   lblOrderByPriceAfter.tr,
                          //   OfferListOrderBy.priceAfter,
                          // ),
                          // MapEntry(
                          //   lblOrderByStartDate.tr,
                          //   OfferListOrderBy.startDate,
                          // ),
                          // MapEntry(
                          //   lblOrderByEndDate.tr,
                          //   OfferListOrderBy.end_date,
                          // ),
                          // MapEntry(
                          //   lblOrderByDiscount.tr,
                          //   OfferListOrderBy.discount,
                          // ),
                        ],
                      );
                    },
                    child: const Icon(
                      Icons.sort_rounded,
                      size: 36,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
