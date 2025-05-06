import 'package:flutter/material.dart';
import 'package:yemen_offers/features/offer/domain/entities/merchant_offer_entity.dart';
import 'package:yemen_offers/features/offer/presentation/views/widgets/merchant_offer_card_widget.dart';

class MerchantStoreOffersListWidget extends StatelessWidget {
  const MerchantStoreOffersListWidget({super.key, required this.offers});

  final List<MerchantOfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children:
              offers.map((offer) {
                return MerchantOfferCardWidget(
                  offer: offer,
                  width: MediaQuery.of(context).size.width * 0.9,
                );
              }).toList(),
        ),
      ),
    );
  }
}
