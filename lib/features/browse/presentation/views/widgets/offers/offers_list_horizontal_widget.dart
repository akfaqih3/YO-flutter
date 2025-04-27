import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offer_card_widget.dart';

class OffersListHorizontalWidget extends StatelessWidget {
  const OffersListHorizontalWidget({
    super.key,
    required this.offers,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  final List<OfferEntity> offers;
  final Color textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            offers.map((offer) {
              return OfferCardWidget(offer: offer,width: MediaQuery.of(context).size.width * 0.7 );
            }).toList(),
      ),
    );
  }
}
