
import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_card_skeleton_widget.dart';

class OfferListVerticalSkeletonWidget extends StatelessWidget {
  const OfferListVerticalSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return OfferCardSkeletonWidget();
      },
    );
  }
}