import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offer_card_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offers_list_vertical_widget.dart';

class SearchOffersWidget extends StatelessWidget {
  const SearchOffersWidget({super.key, required this.offers});

  final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: OffersListVerticalWidget(offers: offers)
      ),
    );
  }
}
