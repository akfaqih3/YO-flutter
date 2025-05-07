import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class StoreListItemWidget extends StatelessWidget {
  const StoreListItemWidget({
    super.key,
    required this.storeName,
    required this.storeDescription,
    required this.imageUrl,
    required this.storeCategory,
    required this.storeAddress,
  });

  final String storeName;
  final String storeDescription;
  final String storeCategory;
  final String storeAddress;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.network(
            imageUrl,
            width: 64,
            height: 72,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
          ),
        ), // RTL: back icon to the left
        title: Text(
          storeName,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${lblcategory.tr}: $storeCategory",
              style: const TextStyle(color: AppColors.grey),
              textAlign: TextAlign.right,
            ),
            Text(
               "${lblAdress.tr}: $storeAddress",
              style:  TextStyle(color: AppColors.primary.withAlpha(500)),
              textAlign: TextAlign.right,
              maxLines: 1,
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios,color: AppColors.grey,)
      ),
    );
  }
}
