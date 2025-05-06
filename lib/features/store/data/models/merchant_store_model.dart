import 'dart:convert';

import 'package:yemen_offers/features/browse/data/models/category_model.dart';
import 'package:yemen_offers/features/browse/data/models/store_model.dart';

List<MerchantStoreModel> MerchantStoreModelFromJson(List<dynamic> json) =>
    List<MerchantStoreModel>.from(json.map((x) => MerchantStoreModel.fromJson(x)));

String MerchantStoreModelToJson(List<MerchantStoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MerchantStoreModel {
  String? address;
  CategoryModel category;
  String? description;
  int? id;
  String? image;
  bool? isActive;
  double? latitude;
  double? longitude;
  String name;
  String phone;
  String? slug;
  SocialMediaModel? socialMedia;
  String? website;
  int? totalOffers;

  MerchantStoreModel({
    this.address,
    required this.category,
    this.description,
    this.id,
    required this.image,
    this.isActive,
    this.latitude,
    this.longitude,
    required this.name,
    required this.phone,
    this.slug,
    this.socialMedia,
    this.website,
    this.totalOffers,
  });

  factory MerchantStoreModel.fromJson(Map<String, dynamic> json) => MerchantStoreModel(
    address: json["address"],
    category: CategoryModel.fromJson(json["category"]),
    description: json["description"],
    id: json["id"],
    image: json["image"],
    isActive: json["is_active"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    name: json["name"],
    phone: json["phone"],
    slug: json["slug"],
    socialMedia: SocialMediaModel.fromJson(json["social_media"]),
    website: json["website"],
    totalOffers: json["total_offers"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "category": category.toJson(),
    "description": description,
    "id": id,
    "image": image,
    "is_active": isActive,
    "latitude": latitude,
    "longitude": longitude,
    "name": name,
    "phone": phone,
    "slug": slug,
    "social_media": socialMedia?.toJson(),
    "website": website,
    "total_offers": totalOffers,
  };
}
