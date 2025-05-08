import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/store_details_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offers_list_vertical_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_list_vertical_skeleton_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/store/store_card_details_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/store/homevertical_card_cuostm.dart';

class StoreDetailsPage extends GetView<StoreDetailsController> {
  @override
  Widget build(BuildContext context) {
    final Rx<StoreEntity?> store = controller.store;
    return Scaffold(
      body: Obx(
        () =>
            store.value == null
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                  children: [
                    ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 350,

                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        child: Image.asset(
                                          store.value?.image ?? "",
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Icon(
                                                    Iconsax.shop_copy,
                                                    size: 200,
                                                    color: AppColors.primary
                                                        .withAlpha(200),
                                                  ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Positioned(
                                    top: 160,
                                    right: 20,
                                    left: 20,
                                    child: StoreCardDetailsWidget(store: store.value!),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Text(
                                    lblOffers.tr,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Obx(
                                    () =>
                                        controller.isOffersLoading.value
                                            ? const OfferListVerticalSkeletonWidget()
                                            : controller.offers.value.isEmpty
                                            ? Text(lblNoOffers.tr)
                                            : OffersListVerticalWidget(
                                              offers: controller.offers.value,
                                            ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey.withAlpha(200),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
