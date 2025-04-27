import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offers/offer_favorite_icon_widget.dart';

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({super.key, required this.offer, this.width=350});

  final OfferEntity offer;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.offerDetails, arguments: {
          'offerSlug': offer.slug,
        });
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
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
                      child: Image.network(
                        offer.image ?? "",
                        fit: BoxFit.fill,
                        width: width,
                        height: 200,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.image_not_supported),
                      ),
                    ),
        
                    // Logo image
                    Positioned(
                      top: 150,
                      right: isRTL ? 8 : null,
                      left: isRTL ? null : 8,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: Colors.deepOrange),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                            offer.store.image ?? "",
                            fit: BoxFit.fill,
                            width: 70,
                            height: 70,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.image_not_supported),
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
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              '${offer.discountPercentage}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
        
                    // Wishlist button
                    Positioned(
                      top: 250,
                      right: isRTL ? null : 8,
                      left: isRTL ? 8 : null,
                      child: OfferFavoriteIconWidget(offer: offer),
                    ),
        
                    // Title
                    Positioned(
                      top: 205,
                      right: isRTL ? 80 : null,
                      left: isRTL ? null : 80,
                      child: SizedBox(
                        width: 180,
                        child: Text(
                          offer.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
        
                    // Description
                    Positioned(
                      top: 240,
                      right: isRTL ? 10 : null,
                      left: isRTL ? null : 10,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          offer.description ?? 'No Description',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
        
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.apply(color: AppColors.secondary),
                        ),
                      ),
                    ),
        
                    // Price section
                    Positioned(
                      bottom: 10,
                      right: isRTL ? 10 : null,
                      left: isRTL ? null : 10,
                      child: Row(
                        children: [
                          if (offer.priceAfter.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '\$${offer.priceAfter}',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          const SizedBox(width: 5),
                          if (offer.priceBefore.isNotEmpty)
                            Text(
                              '\$${offer.priceBefore}',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
