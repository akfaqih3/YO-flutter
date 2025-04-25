



import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers_list_vertical_widget.dart';

class OfferTabWidget extends StatelessWidget {

  final List<OfferEntity> offers;
  final ScrollController scrollController;
  const OfferTabWidget({Key? key, required this.offers, required this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: OffersListVerticalWidget(offers: offers),  
        )
      )
    );
  } 
  
}