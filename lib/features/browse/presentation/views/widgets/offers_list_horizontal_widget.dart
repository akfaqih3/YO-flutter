import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offer_card_widgets.dart';

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
              return GestureDetector(
                onTap: () {
                  // Handle tap action here
                },
                child: OfferCardWidgets(offer: offer),
              );
            }).toList(),
      ),
    );
  }
}
