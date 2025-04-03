import 'package:flutter/material.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/presentation/views/widgets/offer_favorite_icon_widget.dart';
import 'package:yemen_offers/features/favorite/presentation/getX/controllers/favorite_controller.dart';

class OfferCardWidgets extends StatelessWidget {
  const OfferCardWidgets({super.key, required this.offer});

  final OfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.orange),
        ),
        child: SizedBox(
          width: 400,
          height: 300,
          child: Stack(
            children: [
              // Background image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Image.network(
                  offer.image ?? "",
                  fit: BoxFit.fill,
                  width: 300,
                  height: 200,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Icon(Icons.image_not_supported),
                ),
              ),

              // Logo image
              Positioned(
                top: 130,
                left: 8,
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
                      width: 100,
                      height: 100,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),

              // Discount tag
              if (offer.discountPercentage.isNotEmpty)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
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
                right: 8,
                child: OfferFavoriteIconWidget(offer: offer),
              ),

              // Title
              Positioned(
                top: 210,
                left: 110,
                child: SizedBox(
                  width: 180,
                  child: Text(
                    offer.title,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.apply(color: Colors.grey.shade700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              // Description
              Positioned(
                top: 235,
                left: 10,
                child: SizedBox(
                  width: 180,
                  child: Text(
                    offer.description ?? 'No Description',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.apply(color: Colors.grey.shade700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              // Price section
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    if (offer.priceAfter.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
    );
  }
}
