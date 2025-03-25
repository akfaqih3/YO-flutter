// To parse this JSON data, do
//
//     final offerCategoryModel = offerCategoryModelFromJson(jsonString);

import 'dart:convert';

List<OfferCategoryModel> offerCategoryModelFromJson(dynamic json) => List<OfferCategoryModel>.from(json.map((x) => OfferCategoryModel.fromJson(x)));

String offerCategoryModelToJson(List<OfferCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


///OfferCategory
class OfferCategoryModel {
    String? image;
    String name;
    String slug;

    OfferCategoryModel({
        this.image,
        required this.name,
        required this.slug,
    });

    factory OfferCategoryModel.fromJson(Map<String, dynamic> json) => OfferCategoryModel(
        image: json["image"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "slug": slug,
    };
}