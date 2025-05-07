import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class StoreCircleItemWidget extends StatelessWidget {
  const StoreCircleItemWidget({super.key, required this.store});
  final StoreEntity store;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.offerList, arguments: store.slug);
      },
      child: SizedBox(
        width: 120,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withAlpha(300),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
                
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  store.image ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                       Icon(Iconsax.shop, size: 64,color: AppColors.primary.withAlpha(200),),
                ),
              ),
            )
            ,
            Text(
              store.name,
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.bodyMedium,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}