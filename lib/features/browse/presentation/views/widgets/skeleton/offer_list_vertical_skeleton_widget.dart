
import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_card_skeleton_widget.dart';

class OfferListVerticalSkeletonWidget extends StatelessWidget {
  const OfferListVerticalSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return OfferCardSkeletonWidget();
        },
      ),
    );
  }
}