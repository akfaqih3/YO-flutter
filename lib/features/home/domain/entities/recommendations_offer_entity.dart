// import 'package:yemen_offers/features/browse/data/models/offer_model.dart';

// List<RecommendationsOfferEntity> recommendationsOffersEntityFromModel(
//   List<OfferModel> recommendations,
// ) =>
//     recommendations
//         .map((offer) => RecommendationsOfferEntity.fromModel(offer))
//         .toList();

// class RecommendationsOfferEntity {
//   String category;
//   String? description;
//   double? discountPercentage;
//   String endDate;
//   String? image;
//   String priceAfter;
//   String priceBefore;
//   String slug;
//   String startDate;
//   String title;

//   RecommendationsOfferEntity({
//     required this.category,
//     this.description,
//     this.discountPercentage,
//     required this.endDate,
//     required this.image,
//     required this.priceAfter,
//     required this.priceBefore,
//     required this.slug,
//     required this.startDate,
//     required this.title,
//   });

//   factory RecommendationsOfferEntity.fromModel(OfferModel offerModel) {
//     return RecommendationsOfferEntity(
//       slug: offerModel.slug,
//       title: offerModel.title,
//       description: offerModel.description,
//       category: offerModel.category,
//       image: offerModel.image,
//       priceBefore: offerModel.priceBefore,
//       priceAfter: offerModel.priceAfter,
//       discountPercentage: offerModel.discountPercentage,
//       startDate: offerModel.startDate.toString(),
//       endDate: offerModel.endDate.toString(),
//     );
//   }
// }
