import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';
import 'package:yemen_offers/core/theme/colors.dart';
import 'package:yemen_offers/core/utils/date_function_util.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/home/domain/entities/recommendations_offer_entity.dart';

class CarouselImageWidget extends StatelessWidget {
  const CarouselImageWidget({
    super.key,
    this.height = 200,
    required this.width,
    required this.offer,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = Colors.white,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = 0,
  });

  final double? height;
  final double width;
  final OfferEntity offer;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final isRTL = Get.locale?.languageCode == 'ar';
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          image: DecorationImage(
            image:
                isNetworkImage
                    ? NetworkImage(offer.image ?? "")
                    : AssetImage(offer.image ?? "") as ImageProvider,
            fit: fit,
            onError:
                (exception, stackTrace) =>
                    const Icon(Icons.image_not_supported),
          ),
        ),
        child: Stack(
          children: [
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),

            // Offer Content
            Positioned(
              left: 16,
              right: 16,
              bottom: 60, // space above the button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.8),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    offer.store.name ?? "",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  if (offer.priceBefore != null && offer.priceAfter != null)
                    Row(
                      children: [
                        Text(
                          "${offer.priceBefore} ${lblYemeniRial.tr}",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "${offer.priceAfter}${lblYemeniRial.tr}",
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 4),
                  if (offer.endDate != null)
                    Text(
                      "${lblExpiresOn.tr}${formatReadableDate(offer.endDate.toString(), locale: Get.locale?.languageCode ?? 'ar')}",
                      style: TextStyle(color: Colors.white60, fontSize: 12),
                    ),
                ],
              ),
            ),

            // Details Button
            // Details Button
            Positioned(
              bottom: 12,
              right: isRTL ? 12 : null,
              left: isRTL ? null : 12,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.85),
                  foregroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.offerDetails,
                    arguments: {ApiKeys.offerSlug: offer.slug},
                  );
                },
                icon: const Icon(Icons.visibility), // أيقونة العرض
                label: Text(
                  btnViewDetails.tr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
