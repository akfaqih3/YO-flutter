import 'package:yemen_offers/features/browse/data/models/offer_model.dart';
import 'package:yemen_offers/features/browse/domain/entities/store_entity.dart';

List<OfferEntity> offerEntityFromModel(List<OfferModel> offers) {
  return offers.map((offer) => OfferEntity.fromModel(offer)).toList();
}

///Offer
class OfferEntity {
  String category;
  String? description;
  String discountPercentage;
  DateTime? endDate;
  String? image;
  String priceAfter;
  String priceBefore;
  String slug;
  DateTime? startDate;
  StoreEntity store;
  String title;

  OfferEntity({
    required this.category,
    this.description,
    required this.discountPercentage,
    this.endDate,
    this.image,
    required this.priceAfter,
    required this.priceBefore,
    required this.slug,
    this.startDate,
    required this.store,
    required this.title,
  });

  factory OfferEntity.fromModel(OfferModel offerModel) => OfferEntity(
    category: offerModel.category,
    description: offerModel.description,
    discountPercentage: offerModel.discountPercentage.toString(),
    endDate: offerModel.endDate,
    image: offerModel.image,
    priceAfter: offerModel.priceAfter,
    priceBefore: offerModel.priceBefore,
    slug: offerModel.slug,
    startDate: offerModel.startDate,
    store: StoreEntity.fromModel(offerModel.store),
    title: offerModel.title,
  );
}
