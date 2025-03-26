import 'dart:convert';

List<OfferModel> offerModelFromJson(List<dynamic> json) =>
    List<OfferModel>.from(json.map((x) => OfferModel.fromJson(x)));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  String category;
  String? description;
  double? discountPercentage;
  String endDate;
  String? image;
  bool? isActive;
  double priceAfter;
  double priceBefore;
  String? slug;
  String startDate;
  String title;

  OfferModel({
    required this.category,
    this.description,
    this.discountPercentage,
    required this.endDate,
    required this.image,
    this.isActive,
    required this.priceAfter,
    required this.priceBefore,
    this.slug,
    required this.startDate,
    required this.title,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    category: json["category"],
    description: json["description"],
    discountPercentage: double.tryParse(json["discount_percentage"].toString()),
    endDate: json["end_date"],
    image: json["image"],
    isActive: json["is_active"],
    priceAfter: double.tryParse(json["price_after"].toString()) ?? 0,
    priceBefore: double.tryParse(json["price_before"].toString()) ?? 0,
    slug: json["slug"],
    startDate: json["start_date"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "description": description,
    "discount_percentage": discountPercentage,
    "end_date": endDate,
    "image": image,
    "is_active": isActive,
    "price_after": priceAfter,
    "price_before": priceBefore,
    "slug": slug,
    "start_date": startDate,
    "title": title,
  };
}
