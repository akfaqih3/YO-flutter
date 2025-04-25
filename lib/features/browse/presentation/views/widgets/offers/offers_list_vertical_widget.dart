import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offer_card_widget.dart';

class OffersListVerticalWidget extends StatelessWidget {
  const OffersListVerticalWidget({
    super.key,
    required this.offers,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.spacing = 16,
    this.scrollController
  });

  final List<OfferEntity> offers;
  final Color textColor;
  final Color? backgroundColor;
  final double? spacing;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          spacing: spacing!,
          children:
              offers.map((offer) {
                return GestureDetector(
                  onTap: () {
                    // Handle tap action here
                  },
                  child: OfferCardWidget(
                    offer: offer,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
