import 'package:yemen_offers/features/offer/data/models/offer_model.dart';

List<OfferEntity> offerEntityFromModel(List<OfferModel> offers) {
  return offers.map((offer) => OfferEntity.fromModel(offer)).toList();
}

class OfferEntity {
  final String? slug;
  final String title;
  final String? description;
  final String category;
  final String? image;
  final double? priceBefore;
  final double? priceAfter;
  final double? discountPercentage;
  final String? startDate;
  final String? endDate;
  final bool? isActive;

  const OfferEntity({
    required this.slug,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.priceBefore,
    required this.priceAfter,
    required this.discountPercentage,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  factory OfferEntity.fromModel(OfferModel offerModel) {
    return OfferEntity(
      slug: offerModel.slug,
      title: offerModel.title,
      description: offerModel.description,
      category: offerModel.category,
      image: offerModel.image,
      priceBefore: offerModel.priceBefore,
      priceAfter: offerModel.priceAfter,
      discountPercentage: offerModel.discountPercentage,
      startDate: offerModel.startDate,
      endDate: offerModel.endDate,
      isActive: offerModel.isActive,
    );
  }
}
