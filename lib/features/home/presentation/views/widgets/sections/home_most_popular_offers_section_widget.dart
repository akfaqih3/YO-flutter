import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers_list_horizontal.dart';

class HomeMostPopularOffersSectionWidget extends StatelessWidget {
  const HomeMostPopularOffersSectionWidget({super.key, required this.offers});

  final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400, // Adjusted height to fit the new structure
      child: OffersListHorizontal(offers: offers),
    );
  }
}
