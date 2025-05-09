import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offer_favorite_icon_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_image_skeleton_widget.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/skeleton/offer_store_image_skeleton_widget.dart';

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({super.key, required this.offer, this.width = 350});

  final OfferEntity offer;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.offerDetails,
          arguments: {ApiKeys.offerSlug: offer.slug},
        );
      },
      child: Directionality(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          width: width,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SizedBox(
            width: 400,
            height: 300,
            child: Stack(
              children: [
                // Background image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: offer.image ?? "",
                    fit: BoxFit.fill,
                    width: width,
                    height: 170,
                    placeholder: (context, url) => OfferImageSkeletonWidget(),
                    errorWidget:
                        (context, url, error) =>
                            const Icon(Icons.image_not_supported),
                  ),
                ),

                // store Logo image
                Positioned(
                  top: 120,
                  right: isRTL ? 8 : null,
                  left: isRTL ? null : 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(color: Colors.deepOrange),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: CachedNetworkImage(
                        imageUrl: offer.store.image ?? "",
                        fit: BoxFit.fill,
                        width: 80,
                        height: 80,
                        placeholder:
                            (context, url) => OfferStoreImageSkeletonWidget(),
                        errorWidget:
                            (context, url, error) =>
                                const Icon(Icons.image_not_supported, size: 64),
                      ),
                    ),
                  ),
                ),

                // Discount tag
                if (offer.discountPercentage.isNotEmpty)
                  Positioned(
                    top: 8,
                    right: isRTL ? null : 8,
                    left: isRTL ? 8 : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${offer.discountPercentage}%',

                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                // Wishlist button
                Positioned(
                  bottom: 4,
                  right: isRTL ? null : 8,
                  left: isRTL ? 8 : null,
                  child: OfferFavoriteIconWidget(offer: offer),
                ),

                // Title
                Positioned(
                  top: 180,
                  right: isRTL ? 90 : null,
                  left: isRTL ? null : 90,
                  child: SizedBox(
                    width: 180,
                    child: Text(
                      offer.store.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),

                // offer title
                Positioned(
                  top: 210,
                  right: isRTL ? 16 : null,
                  left: isRTL ? null : 16,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      offer.title ?? lblNoOffers.tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),

                // Price section
                Positioned(
                  bottom: 8,
                  right: isRTL ? 10 : null,
                  left: isRTL ? null : 10,
                  child: Row(
                    children: [
                      if (offer.priceAfter.toString().isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),

                          child: Text(
                            '${offer.priceAfter}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      const SizedBox(width: 5),
                      if (offer.priceBefore.toString().isNotEmpty)
                        Text(
                          '${offer.priceBefore}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
