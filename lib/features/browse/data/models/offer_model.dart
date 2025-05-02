import 'package:yemen_offers/features/browse/data/models/offer_category_model.dart';
import 'package:yemen_offers/features/browse/data/models/store_model.dart';

List<OfferModel> offersModelFromJson(List<dynamic> json) =>
    List<OfferModel>.from(json.map((x) => OfferModel.fromJson(x)));

///Offer
class OfferModel {
  OfferCategoryModel category;
  String? description;
  String? discountPercentage;
  String? endDate;
  String? image;
  String priceAfter;
  String priceBefore;
  String slug;
  String? startDate;
  StoreModel store;
  String title;

  OfferModel({
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

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    category: OfferCategoryModel.fromJson(json["category"]),
    description: json["description"],
    discountPercentage: json["discount_percentage"].toString(),
    endDate: json["end_date"].toString(),
    image: json["image"],
    priceAfter: json["price_after"].toString(),
    priceBefore: json["price_before"].toString(),
    slug: json["slug"],
    startDate: json["start_date"].toString(),
    store: StoreModel.fromJson(json["store"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "category": category.slug,
    "description": description,
    "discount_percentage": discountPercentage,
    "end_date": endDate?.toString(),
    "image": image,
    "price_after": priceAfter,
    "price_before": priceBefore,
    "slug": slug,
    "start_date": startDate?.toString(),
    "store": store.toJson(),
    "title": title,
  };
}
