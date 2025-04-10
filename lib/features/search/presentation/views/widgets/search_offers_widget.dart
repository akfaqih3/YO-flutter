import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offer_card_widgets.dart';

class SearchOffersWidget extends StatelessWidget {
  const SearchOffersWidget({super.key, required this.offers});

  final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return OfferCardWidgets(offer: offers[index]);
        },
      ),
    );
  }
}
