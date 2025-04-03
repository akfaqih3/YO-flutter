import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offer_card_widgets.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers_list_horizontal_widget.dart';

class HomeLatestOffersWidget extends StatelessWidget {
  const HomeLatestOffersWidget({super.key, required this.offers});
  final List<OfferEntity> offers;
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      child: 
      OffersListHorizontalWidget(offers: offers)
    );
  }
}
