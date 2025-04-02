import 'package:yemen_offers/features/browse/data/models/store_model.dart';

List<OfferModel> offersModelFromJson(List<dynamic> json) =>
    List<OfferModel>.from(json.map((x) => OfferModel.fromJson(x)));

///Offer
class OfferModel {
  String category;
  String? description;
  double? discountPercentage;
  DateTime? endDate;
  String? image;
  String priceAfter;
  String priceBefore;
  String slug;
  DateTime? startDate;
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
    category: json["category"],
    description: json["description"],
    discountPercentage: json["discount_percentage"],
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    image: json["image"],
    priceAfter: json["price_after"],
    priceBefore: json["price_before"],
    slug: json["slug"],
    startDate:
        json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    store: StoreModel.fromJson(json["store"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "description": description,
    "discount_percentage": discountPercentage,
    "end_date": endDate?.toIso8601String(),
    "image": image,
    "price_after": priceAfter,
    "price_before": priceBefore,
    "slug": slug,
    "start_date": startDate?.toIso8601String(),
    "store": store.toJson(),
    "title": title,
  };
}
