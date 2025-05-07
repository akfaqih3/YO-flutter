import 'package:flutter/material.dart';
import 'package:yemen_offers/core/common/presentation/widgets/store_circle_item_widget.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offer_card_widget.dart';

class StoreListHorizontalWidget extends StatelessWidget {
  const StoreListHorizontalWidget({
    super.key,
    required this.stores,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.spacing = 16,
  });

  final List<StoreEntity> stores;
  final Color textColor;
  final Color? backgroundColor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              stores.map((store) {
                return StoreCircleItemWidget(store: store);
              }).toList(),
        ),
      ),
    );
  }
}
