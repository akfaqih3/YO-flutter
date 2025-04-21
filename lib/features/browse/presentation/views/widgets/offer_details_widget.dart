import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class OfferDetailsWidget extends StatelessWidget {
  final OfferEntity? offer;

  const OfferDetailsWidget({Key? key, this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(offer!.title!),
        Text(offer!.description!),
        Text(offer!.priceBefore!),
        Text(offer!.priceAfter!),
        Text(offer!.startDate!.toString()),
        Text(offer!.endDate!.toString()),
        Text(offer!.category!),
        Text(offer!.image!),
      ],
    );
  }
}
