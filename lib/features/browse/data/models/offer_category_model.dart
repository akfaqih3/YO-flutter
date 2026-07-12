

import 'dart:convert';

List<OfferCategoryModel> offerCategoriesModelFromJson(dynamic json) => List<OfferCategoryModel>.from(json.map((x) => OfferCategoryModel.fromJson(x)));

String offerCategoryModelToJson(List<OfferCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


///OfferCategory
class OfferCategoryModel {
    String? image;
    String name;
    String nameAr;
    String slug;

    OfferCategoryModel({
        this.image,
        required this.name,
        required this.nameAr,
        required this.slug,
    });

    factory OfferCategoryModel.fromJson(Map<String, dynamic> json) => OfferCategoryModel(
        image: json["image"],
        name: json["name"],
        nameAr: json["name_ar"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "name_ar": nameAr,
        "slug": slug,
    };
}