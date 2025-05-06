import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';

class OfferFavoriteIconWidget extends StatelessWidget {
  OfferFavoriteIconWidget({super.key, required this.offer});

  final OfferEntity offer;
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final favorites = favoriteController.favorites.value;
      final offerFavorited =favorites.firstWhereOrNull((element) => element.offer.slug == offer.slug);

      return offerFavorited != null
          ? IconButton(
              onPressed: () {
                FavoriteController.removeOffer(offerFavorited.id);
              },
              icon: Icon(
                Icons.favorite,
                color: AppColors.primary,
                size: 32,
              ),
            )
          : IconButton(
              onPressed: () {
                FavoriteController.saveOffer(offer.slug);
              },
              icon: Icon(
                Icons.favorite_border,
                color: AppColors.primary,
                size: 32,
              ),
            );
    });
  }
}
