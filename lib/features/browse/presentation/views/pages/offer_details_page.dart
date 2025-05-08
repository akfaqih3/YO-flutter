import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/presentation/getX/controllers/offer_details_controller.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_action_buttons_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_header_actions_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_location_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_date_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_description_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_image_header_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_price_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_store_section_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/details/offer_title_section_widget.dart';

class OfferDetailsPage extends GetView<OfferDetailsController> {
  const OfferDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final offer = controller.offer.value;
        return offer == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
              children: [
                // Main content
                ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    // Image header
                    OfferImageHeaderWidget(imageUrl: offer.image ?? ""),

                    // Content sections with consistent padding
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OfferTitleSectionWidget(
                            title: offer.title,
                            discountPercentage: offer.discountPercentage,
                          ),
                          const SizedBox(height: 16),

                          OfferDescriptionSectionWidget(
                            description:
                                offer.description ?? txtNoDescription.tr,
                            controller: controller,
                          ),
                          const SizedBox(height: 16),

                          OfferPriceSectionWidget(
                            priceAfter: offer.priceAfter,
                            priceBefore: offer.priceBefore,
                          ),
                          const SizedBox(height: 16),

                          OfferDateSectionWidget(
                            startDate: offer.startDate,
                            endDate: offer.endDate,
                          ),
                          const SizedBox(height: 16),

                          OfferLocationSectionWidget(
                            address: offer.store.address ?? "",
                          ),
                          const SizedBox(height: 16),

                          OfferStoreSectionWidget(
                            store: offer.store,
                            onTap: () => () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                OfferHeaderActionsWidget(
                  onBackPressed: () => Navigator.pop(context),
                  onFavoritePressed: () => () {},
                  onSharePressed: () {
                    controller.shareOfferUser(context);
                  },
                ),
              ],
            );
      }),
      bottomNavigationBar: Obx(() {
        final offer = controller.offer.value;
        if (offer == null) return const SizedBox.shrink();
        return OfferActionButtonsWidget(
          onGetOfferPressed: () => () {},
          onCallPressed: () => () {},
        );
      }),
    );
  }
}
