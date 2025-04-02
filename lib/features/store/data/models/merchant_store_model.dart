import 'dart:convert';

import 'package:yemen_offers/features/browse/data/models/store_model.dart';

List<MerchantStoreModel> MerchantStoreModelFromJson(List<dynamic> json) =>
    List<MerchantStoreModel>.from(json.map((x) => MerchantStoreModel.fromJson(x)));

String MerchantStoreModelToJson(List<MerchantStoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MerchantStoreModel {
  String? address;
  String category;
  String? description;
  int? id;
  String? image;
  bool? isActive;
  String? latitude;
  String? longitude;
  String name;
  String phone;
  String? slug;
  SocialMediaModel? socialMedia;
  String? website;

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
  });

  factory MerchantStoreModel.fromJson(Map<String, dynamic> json) => MerchantStoreModel(
    address: json["address"],
    category: json["category"],
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
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "category": category,
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
  };
}
