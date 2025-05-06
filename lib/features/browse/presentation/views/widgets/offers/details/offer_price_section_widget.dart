import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
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
    return Column(
      children: [
        Row(
          children: [
            Text("السعر قبل: ", style: Get.theme.textTheme.bodyMedium,),
            Text(
              priceAfter,
              style: Get.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Row(
          children: [
            Text("السعر بعد: ", style: Get.theme.textTheme.bodyMedium,),
            Text(
              priceBefore,
              style: Get.theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.black.withAlpha(0x80),
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}