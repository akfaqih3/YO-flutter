import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offer_card_widgets.dart';

class OffersListVerticalWidget extends StatelessWidget {
  const OffersListVerticalWidget({
    super.key,
    required this.offers,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.spacing = 8,
  });

  final List<OfferEntity> offers;
  final Color textColor;
  final Color? backgroundColor;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        spacing: spacing!,
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
