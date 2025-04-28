import 'package:flutter/material.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class OfferPriceSectionWidget extends StatelessWidget {
  final String priceAfter;
  final String priceBefore;

  const OfferPriceSectionWidget({
    Key? key,
    required this.priceAfter,
    required this.priceBefore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(80),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            priceAfter,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          priceBefore,
          style: TextStyle(
            color: Colors.grey[600],
            decoration: TextDecoration.lineThrough,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}