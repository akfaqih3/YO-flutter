import 'package:yemen_offers/features/offer/data/models/offer_category_model.dart';

List<OfferCategoryEntity> offerCategoryEntityFromModel(
  List<OfferCategoryModel> offerCategories,
) {
  return offerCategories
      .map((offerCategory) => OfferCategoryEntity.fromModel(offerCategory))
      .toList();
}

class OfferCategoryEntity {
  final String name;
  final String slug;

  const OfferCategoryEntity({required this.name, required this.slug});

  factory OfferCategoryEntity.fromModel(OfferCategoryModel offerCategoryModel) {
    return OfferCategoryEntity(
      name: offerCategoryModel.name,
      slug: offerCategoryModel.slug,
    );
  }
}
