import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/favorite/domain/entities/favorite_entity.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FavoriteIconWidget extends StatelessWidget {
  FavoriteIconWidget({super.key, required this.favorites});
  final List<FavoriteEntity> favorites;
  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Iconsax.heart,
            size: 36,
            color: AppColors.grey,
          ),
          onPressed: () {
            Get.toNamed(AppRoutes.favorites);
          },
        ),
        if (favorites.isNotEmpty)
          Positioned(
            right: isRTL ? 5 : null,
            left: isRTL ? null : 5,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(minWidth: 20, minHeight: 20),
              child: Text(
                favorites.length.toString(),
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
