import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

class StoreMarkerPopupWidget extends StatelessWidget {
  const StoreMarkerPopupWidget({super.key, required this.store});

  final StoreEntity store;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 250,
        height: 120,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child:
                  store.image != null
                      ? Image.network(
                        store.image!,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      )
                      : Icon(
                        Iconsax.shop_copy,
                        size: 100,
                        color: AppColors.primary.withAlpha(200),
                      ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  store.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${lblcategory.tr}:${Get.locale?.languageCode == 'ar' ? store.category.nameAr : store.category.name}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  ' عروض متوفرة',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    Get.toNamed(
                      AppRoutes.storeDetails,
                      arguments: {ApiKeys.store: store},
                    );
                  },
                  child: Text(
                    btnViewDetails.tr,
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
