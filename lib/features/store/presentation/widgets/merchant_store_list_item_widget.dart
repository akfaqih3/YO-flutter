import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';

class MerchantStoreListItemWidget extends StatelessWidget {
  final MerchantStoreEtity store;

  const MerchantStoreListItemWidget({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.merchantStoreDetails, arguments: store);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            children: [
              // Store image
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: store.image != null
                    ? Image.network(
                        store.image!,
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        fit: BoxFit.cover,
                      )
                    : const CircleAvatar(
                        radius: 24,
                        child: Icon(Icons.store,),
                      ),
              ),
        
              const SizedBox(width: 12),
        
              // Info column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Text(
                      store.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${lblcategory.tr}: ${store.category.name}',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (store.totalOffers != null)
                      Text(
                        '${lblOffersCount.tr}: ${store.totalOffers}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
        
              const SizedBox(width: 12),
        
              // Trailing icon
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
        
              ),
            ],
          ),
        ),
      ),
    );
  }
}
