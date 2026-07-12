import 'dart:convert';

import 'package:yemen_offers/features/browse/data/models/offer_category_model.dart';

List<MerchantOfferModel> MerchantOfferModelFromJson(List<dynamic> json) =>
    List<MerchantOfferModel>.from(json.map((x) => MerchantOfferModel.fromJson(x)));

String MerchantOfferModelToJson(MerchantOfferModel data) => json.encode(data.toJson());

class MerchantOfferModel {
  OfferCategoryModel category;
  String? description;
  double? discountPercentage;
  String endDate;
  String? image;
  bool? isExpired;
  double priceAfter;
  double priceBefore;
  String? slug;
  String startDate;
  String title;
  int? totalViews;
  int? totalClicks;
  int? totalShares;
  int? totalFavorites;

  MerchantOfferModel({
    required this.category,
    this.description,
    this.discountPercentage,
    required this.endDate,
    required this.image,
    this.isExpired,
    required this.priceAfter,
    required this.priceBefore,
    this.slug,
    required this.startDate,
    required this.title,
    this.totalViews,
    this.totalClicks,
    this.totalShares,
    this.totalFavorites,
  });

  factory MerchantOfferModel.fromJson(Map<String, dynamic> json) => MerchantOfferModel(
    category: OfferCategoryModel.fromJson(json["category"]),
    description: json["description"],
    discountPercentage: double.tryParse(json["discount_percentage"].toString()),
    endDate: json["end_date"],
    image: json["image"],
    isExpired: json["is_active"],
    priceAfter: double.tryParse(json["price_after"].toString()) ?? 0,
    priceBefore: double.tryParse(json["price_before"].toString()) ?? 0,
    slug: json["slug"],
    startDate: json["start_date"],
    title: json["title"],
    totalViews: json["total_views"],
    totalClicks: json["total_clicks"],
    totalShares: json["total_shares"],
    totalFavorites: json["total_favorites"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "description": description,
    "discount_percentage": discountPercentage,
    "end_date": endDate,
    "image": image,
    "price_after": priceAfter,
    "price_before": priceBefore,
    "slug": slug,
    "start_date": startDate,
    "title": title,
  };
}
