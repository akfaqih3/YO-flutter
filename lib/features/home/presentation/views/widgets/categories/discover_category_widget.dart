import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:yemen_offers/core/constants/app_assets.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';

class DiscoverCategoryWidget extends StatelessWidget {
  const DiscoverCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.primary, width: 0.4),

        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(AppAssets.map),
          fit: BoxFit.contain,
          opacity: 0.4,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(300),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.map_sharp,color: AppColors.black,),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.offerList);
            },
            child: Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
              width: 64,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.primary, width: 1),
              ),
              child: Center(
                child: Text(
                  btnDiscover.tr,
                  style: Get.theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Text(
            lblNearbyOffers.tr,
            style: Get.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
