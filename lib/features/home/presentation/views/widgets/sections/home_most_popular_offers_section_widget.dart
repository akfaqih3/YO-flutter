import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offers_list_horizontal_widget.dart';

class HomeMostPopularOffersSectionWidget extends StatelessWidget {
  const HomeMostPopularOffersSectionWidget({super.key, required this.offers});

  final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: OffersListHorizontalWidget(offers: offers),
    );
  }
}
