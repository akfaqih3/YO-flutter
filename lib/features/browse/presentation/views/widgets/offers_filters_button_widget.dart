import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:yemen_offers/core/common/controllers/offers_filters_controller.dart';
import 'package:yemen_offers/core/common/presentation/layout/offers_filters_layout.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_list_controller.dart';

class OffersFiltersButtonWidget extends StatelessWidget {
  const OffersFiltersButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 60),
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          offset: Offset.zero,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1,
            child: ElevatedButton(
              onPressed: () {
                _showFiltersBottomSheet(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 6,
                backgroundColor: Get.theme.scaffoldBackgroundColor,
                shadowColor: AppColors.black.withAlpha(300),
                shape: StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 20,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.filter_list,
                    size: 24,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    btnFilter.tr,
                    style: Get.theme.textTheme.bodyLarge?.copyWith(
                      color: Get.theme.textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                    color: Get.theme.textTheme.bodyLarge?.color,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showFiltersBottomSheet(BuildContext context) {
    

    Get.bottomSheet(
      backgroundColor: AppColors.background,
      OffersFiltersLayout(
        controller: Get.find<OfferListController>().offersFiltersController,
      ),
      enterBottomSheetDuration: const Duration(milliseconds: 300),
      exitBottomSheetDuration: const Duration(milliseconds: 300),
      isScrollControlled: true,
      // settings: RouteSettings(name: AppRoutes.filter),
    );
  }
}
