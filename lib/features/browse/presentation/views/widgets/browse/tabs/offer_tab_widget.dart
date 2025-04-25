import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offers_list_vertical_widget.dart';

class OfferTabWidget extends StatelessWidget {
  final List<OfferEntity> offers;
  final ScrollController scrollController;
  const OfferTabWidget({
    Key? key,
    required this.offers,
    required this.scrollController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OffersListVerticalWidget(offers: offers,scrollController: scrollController,);
  }
}
