import 'package:flutter/material.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';

class BrowseOfferCategoryWidget extends StatelessWidget {
  const BrowseOfferCategoryWidget({
    super.key,
    required this.offerCategoy,
    required this.onTap,
    required this.isSelected,
  });

  final OfferCategoryEntity offerCategoy;
  final GestureTapCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.04,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          constraints: const BoxConstraints(minWidth: 80),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(isSelected ? 100 : 0),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppColors.secondary.withAlpha(100)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: () {
              onTap();
            },
            splashColor: AppColors.primary.withAlpha(100),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                offerCategoy.name,
                style: TextStyle(
                  color: AppColors.textPrimary.withAlpha(200),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
