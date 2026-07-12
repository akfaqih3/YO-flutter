import 'package:yemen_offers/features/browse/domain/entities/offer_category_entity.dart';
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
  final OfferCategoryEntity category;
  final String? image;
  final double? priceBefore;
  final double? priceAfter;
  final double? discountPercentage;
  final String? startDate;
  final String? endDate;
  final bool? isExpired;
  final int? totalViews;
  final int? totalClicks;
  final int? totalShares;
  final int? totalFavorites;

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
    required this.isExpired,
    this.totalViews,
    this.totalClicks,
    this.totalShares,
    this.totalFavorites,
  });

  factory MerchantOfferEntity.fromModel(MerchantOfferModel offerModel) {
    return MerchantOfferEntity(
      slug: offerModel.slug,
      title: offerModel.title,
      description: offerModel.description,
      category: OfferCategoryEntity.fromModel(offerModel.category),
      image: offerModel.image,
      priceBefore: offerModel.priceBefore,
      priceAfter: offerModel.priceAfter,
      discountPercentage: offerModel.discountPercentage,
      startDate: offerModel.startDate,
      endDate: offerModel.endDate,
      isExpired: offerModel.isExpired,
      totalViews: offerModel.totalViews,
      totalClicks: offerModel.totalClicks,
      totalShares: offerModel.totalShares,
      totalFavorites: offerModel.totalFavorites,
    );
  }

  toModel() {
    return MerchantOfferModel(
      category: category.toModel(),
      description: description,
      discountPercentage: discountPercentage,
      endDate: endDate ?? '',
      image: image,
      priceAfter: priceAfter ?? 0,
      priceBefore: priceBefore ?? 0,
      slug: slug,
      startDate: startDate ?? '',
      title: title,
      totalViews: totalViews,
      totalClicks: totalClicks,
      totalShares: totalShares,
      totalFavorites: totalFavorites,
    );
  }
}
