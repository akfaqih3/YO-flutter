import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_card_skeleton_widget.dart';

class OfferListHorizontalSkeletonWidget extends StatelessWidget {
  const OfferListHorizontalSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return OfferCardSkeletonWidget(width: 300);
        },
      ),
    );
  }
}
