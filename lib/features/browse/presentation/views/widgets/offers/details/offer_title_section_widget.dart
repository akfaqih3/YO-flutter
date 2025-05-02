import 'package:flutter/material.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class OfferTitleSectionWidget extends StatelessWidget {
  final String title;
  final dynamic discountPercentage;

  const OfferTitleSectionWidget({
    Key? key,
    required this.title,
    required this.discountPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 70,
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
            "$discountPercentage%",
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}