import 'package:yemen_offers/features/offer/data/models/merchant_offer_model.dart';

List<MerchantOfferEntity> MerchantOfferEntityFromModel(
  List<MerchantOfferModel> offers,
) {
  return offers.map((offer) => MerchantOfferEntity.fromModel(offer)).toList();
}

class MerchantOfferEntity {
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

  const MerchantOfferEntity({
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

  factory MerchantOfferEntity.fromModel(MerchantOfferModel offerModel) {
    return MerchantOfferEntity(
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
