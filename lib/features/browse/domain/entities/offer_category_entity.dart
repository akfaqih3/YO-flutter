import 'package:yemen_offers/features/browse/data/models/offer_category_model.dart';

List<OfferCategoryEntity> offerCategoryEntityFromModel(
  List<OfferCategoryModel> offerCategories,
) {
  return offerCategories
      .map((offerCategory) => OfferCategoryEntity.fromModel(offerCategory))
      .toList();
}

class OfferCategoryEntity {
  final String name;
  final String nameAr;
  final String slug;
  final String? image;

  const OfferCategoryEntity({
    required this.name,
    required this.nameAr,
    required this.slug,
    this.image,
  });

  factory OfferCategoryEntity.fromModel(OfferCategoryModel offerCategoryModel) {
    return OfferCategoryEntity(
      name: offerCategoryModel.name,
      nameAr: offerCategoryModel.nameAr,
      slug: offerCategoryModel.slug,
      image: offerCategoryModel.image,
    );
  }
}
