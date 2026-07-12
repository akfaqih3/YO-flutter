import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/features/offer/presentation/views/widgets/merchant_offer_card_widget.dart';
import 'package:yemen_offers/features/store/presentation/getX/controllers/merchant_store_details_controller.dart';

class MerchantOffersPage extends GetView<MerchantStoreDetailsController> {
  const MerchantOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = controller.offers;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children:
                offers.map((offer) {
                  return MerchantOfferCardWidget(
                    offer: offer,
                    width: MediaQuery.of(context).size.width * 0.8,
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
